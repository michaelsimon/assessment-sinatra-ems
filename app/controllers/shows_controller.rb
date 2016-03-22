class ShowsController < ApplicationController

  get '/shows' do
    @shows = Show.all
    erb :"shows/index"
  end

  get '/shows/new' do
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