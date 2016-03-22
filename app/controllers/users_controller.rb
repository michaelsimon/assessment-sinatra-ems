class UsersController < ApplicationController

  get '/users' do
    @user = User.find(session[:user_id])
    erb :"users/index"
  end

  get '/users/login' do
    erb :"users/login"
  end

  get '/users/new' do
    erb :"users/new"
  end

  get '/users/edit' do
    @user = User.find(session[:user_id])
    erb :"users/edit"
  end
  
end