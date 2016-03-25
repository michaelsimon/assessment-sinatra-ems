class VenuesController < ApplicationController

  get '/venues/?' do
    @venues = Venue.all
    erb :"venues/index"
  end

  get '/venues/new/?' do
    erb :"venues/new"
  end

  get '/venues/:id/?' do
    @venue = Venue.find(params[:id])
    erb :"venues/detail"
  end

  get '/venues/:id/edit/?' do
    @venue = Venue.find(params[:id])
    erb :"venues/edit"
  end
  

  delete '/venues/:id/delete/?' do
    @venue = Venue.find(params[:id])
    @venue.delete if @venue
    redirect to '/venues'
  end

  post '/venues' do 
    @venue = Venue.create(params)
    if @venue
        redirect to '/venues'
      else
        redirect to '/venues/new'
      end
    end

  post '/venues/:id/?' do
    @venue = Venue.create(params)
    if @venue
      @venue.update(name: params[:name], address: params[:address], zipcode: params[:zipcode], phone: params[:phone], email: params[:email], website: params[:website])
        redirect to '/venues'
      else
        redirect to "/venues/#{params[:id]/edit}"
      end
    end
  
end