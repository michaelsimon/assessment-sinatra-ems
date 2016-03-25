class ShowsController < ApplicationController

  get '/shows' do
    @shows = Show.all
    erb :"shows/index"
  end

  get '/shows/new', :auth => :user_id do
    # if !logged_in?
    #   flash[:notice] = "You must login to create a new show" 
    #   redirect to '/users/login'
    # end
    @venues = Venue.all
    @acts = Act.all
    erb :"shows/new"
  end

  get '/shows/:id' do
    @show = Show.find(params[:id])
    erb :"shows/detail"
  end

  get '/shows/:id/edit' do
    @show = Show.find(params[:id])
    @venues = Venue.all
    @acts = Act.all
    erb :"shows/edit"
  end

end