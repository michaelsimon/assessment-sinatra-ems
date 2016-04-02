class ShowsController < ApplicationController

  get '/shows/?', :auth => :user_id do
    @shows = Show.all
    erb :"shows/index"
  end

  get '/shows/new/?', :auth => :user_id do
    @venues = Venue.all
    @acts = Act.all
    erb :"shows/new"
  end

  get '/shows/:id/?', :auth => :user_id do
    @show = Show.find(params[:id])
    if @show
      erb :"shows/detail"
    else
      flash[:error] = "Show not found." 
      redirect to '/shows'
    end
  end

  get '/shows/:id/edit/?', :auth => :user_id do
    @show = Show.find(params[:id])
    if @show 
      if @show.user_id == session[:user_id]
        @venues = Venue.all
        @acts = Act.all
        erb :"shows/edit"
      else
        flash[:error] = "You are unable to edit a show you did not create." 
        redirect to '/shows'
      end
    else
      flash[:error] = "Show not found." 
      redirect to '/shows'
    end
  end

  get '/shows/:id/delete/?', :auth => :user_id do
    @show = Show.find(params[:id])
    if @show 
      if @show.user_id == session[:user_id]
        @show.delete
        flash[:success]="Show deleted."
      else
        flash[:error] = "You are unable to delete a show you did not create." 
      end
    else
      flash[:error] = "Show not found." 
    end
    redirect to '/shows'
  end

  post '/shows', :auth => :user_id do
    @show = Show.new(params)
    @show.user_id = params[:user_id]
    if @show.save
      redirect to "/shows/#{@show.id}"
    else
      flash[:error]="Unable to create show, please try again, ensuring all fields are filled out."
      redirect to '/shows/new'
    end
  end

  post '/shows/:id', :auth => :user_id do
    @show = Show.find(params[:id])
    if @show
      if @show.update(params.except!("splat","captures")).valid?
        redirect to "/shows/#{@show.id}"
      else
        flash[:error] = "Unable to update show, please try again." 
        redirect to "/shows/#{params[:id]/edit}"
      end
    else
      flash[:error] = "Show not found." 
      redirect to '/shows'
    end
  end
end