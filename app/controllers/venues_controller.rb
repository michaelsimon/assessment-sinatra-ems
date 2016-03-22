class VenuesController < ApplicationController

  get '/venues' do
    @venues = Venue.all
    erb :"venues/venues"
  end

  get '/venues/new' do
    erb :"venues/new"
  end

  get '/venues/:id' do
    @venue = Venue.find(params[:id])
    erb :"venues/detail"
  end

  get '/venues/:id/edit' do
    @act = Venue.find(params[:id])
    erb :"venues/edit"
  end
  
end