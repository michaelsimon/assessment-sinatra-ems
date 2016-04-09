class VenuesController < ApplicationController

  get '/venues/?', :auth => :user_id do
    @venues = Venue.all
    erb :"venues/index"
  end

  get '/venues/new/?', :auth => :user_id do
    erb :"venues/new"
  end

  get '/venues/:id/?', :auth => :user_id do
    @venue = Venue.find(params[:id])
    if @venue
      erb :"venues/detail"
    else
      flash[:error] = "Venue not found." 
      redirect to '/venues'
    end
  end

  get '/venues/:id/edit/?', :auth => :id do
    @venue = Venue.find(params[:id])
    if @venue
      if @venue.user_id == session[:user_id]
        erb :"venues/edit"
      else
        flash[:error] = "You are unable to edit a venue you did not create." 
        redirect to '/venues'
      end
    else
      flash[:error] = "Venue not found." 
      redirect to '/venues'
    end
  end

  get '/venues/:id/delete/?', :auth => :user_id do
    @venue = Venue.find(params[:id])
    if @venue
      if @venue.user_id == session[:user_id]
        @venue.delete
        flash[:success] = "Venue deleted." 
      else
        flash[:error] = "You are unable to delete a venue you did not create." 
        redirect to '/venues'
      end
    else
      flash[:error] = "Venue not found." 
    end
    redirect to '/venues'
  end

  post '/venues', :auth => :user_id do 
    @venue = Venue.create(params)
    if @venue
      redirect to "/venues/#{@venue.id}"
    else
      flash[:error] = "Unable to create venue, please try again, ensuring all fields are filled out." 
      redirect to '/venues/new'
    end
  end

  post '/venues/:id', :auth => :user_id do
    @venue = Venue.find(params[:id])
    if @venue
      if @venue.update(params.except("splat","captures"))
        redirect to "/venues/#{@venue.id}"
      else
        flash[:error] = "Unable to update venue, please try again." 
        redirect to "/venues/#{params[:id]}/edit"
      end
    else
      flash[:error] = "Venue not found." 
      redirect to '/venues'
    end
  end

end