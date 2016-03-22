class ActsController < ApplicationController

  get '/acts' do
    @acts - Act.all
    erb :"acts/index"
  end

  get '/acts/new' do
    erb :"shows/new"
  end

  get '/acts/:slug' do
    @act = Act.find_by_slug(params[:slug])
    erb :"acts/detail"
  end

  get '/acts/:slug/edit' do
    @act = Act.find_by_slug(params[:slug])
    erb :"acts/edit"
  end
  
end