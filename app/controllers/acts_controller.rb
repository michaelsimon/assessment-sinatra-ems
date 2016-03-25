class ActsController < ApplicationController

  get '/acts/?' do
    @acts = Act.all
    erb :"acts/index"
  end

  get '/acts/new/?' do
    erb :"acts/new"
  end

  get '/acts/:slug/?' do
    @act = Act.find_by_slug(params[:slug])
    erb :"acts/detail"
  end

  get '/acts/:slug/edit/?' do
    @act = Act.find_by_slug(params[:slug])
    erb :"acts/edit"
  end

  delete '/acts/:slug/delete/?' do
    @act = Act.find_by_slug(params[:slug])
    @act.delete if @act
    redirect to '/acts'
  end

  post '/acts' do 
    @act = Act.create(params)
    if @act
        redirect to '/acts'
      else
        redirect to '/acts/new'
      end
    end
  post '/acts/:slug/?' do
    @act = Act.find_by_slug(params[:slug])
    if @act
      # binding.pry
      @act.update(name: params[:name], description: params[:description], size: params[:size], location: params[:location], website: params[:website])
        redirect to '/acts'
      else
        redirect to "/venues/#{params[:slug]/edit}"
      end
    end
  
end