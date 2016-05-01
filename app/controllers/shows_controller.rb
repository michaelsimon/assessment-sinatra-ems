class ShowsController < ApplicationController

  get '/shows/?', :auth => true do
    @shows = Show.all
    erb :"shows/index"
  end

  get '/shows/new/?', :auth => true do
    @venues = Venue.all
    @acts = Act.all
    erb :"shows/new"
  end

  get '/shows/:id/?', :auth => true do
    @show = Show.find(params[:id])
    if @show
      erb :"shows/detail"
    else
      flash[:error] = "Show not found." 
      redirect to '/shows'
    end
  end

  get '/shows/:id/edit/?', :auth => true do
    @show = Show.find(params[:id])
    if @show 
      if @show.user_id == current_user
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

  get '/shows/:id/delete/?', :auth => true do
    @show = Show.find(params[:id])
    if @show 
      if @show.user_id == current_user
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

  post '/shows', :auth => true do
    @show = Show.new(params)
    @show.user_id = current_user
    if @show.save
      redirect to "/shows/#{@show.id}"
    else
      flash[:error]="Unable to create show, please try again, ensuring all fields are filled out."
      redirect to '/shows/new'
    end
  end

  post '/shows/:id', :auth => true do
    @show = Show.find(params[:id])
    if @show
      if @show.update(act_id: params[:act_id], venue_id: params[:venue_id], show_date: params[:show_date], show_time: params[:show_time], tkts_url: params[:tkts_url], description: params[:description], name: params[:name])
        redirect to "/shows/#{@show.id}"
      else
        flash[:error] = "Unable to update show, please try again." 
        redirect to "/shows/#{params[:id]}/edit"
      end
    else
      flash[:error] = "Show not found." 
      redirect to '/shows'
    end
  end
end