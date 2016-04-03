class UsersController < ApplicationController

  get '/users/new/?' do
    if !logged_in?
      erb :"users/new"
    else
      flash[:error] = "You already have an account and are logged in." 
      redirect to '/'
    end
  end

  get '/users/edit/?', :auth => :user_id do
    @user = User.find(session[:user_id])
    if @user
      erb :"users/edit"
    else
      flash[:error] = "Unable to locate your profile." 
      redirect to '/'
    end
  end

  post '/users' do
    @user = User.create(params)
    if @user.valid?
      session[:user_id] = @user.id
      session[:username] = @user.name 
      redirect to '/'
    else
      flash[:error] = "You must provide your name and a valid e-mail address and password to create an account." 
      redirect to '/users/new'
    end
  end
  

  post '/users/edit' do 
    user = User.find(session[:user_id])
    if user
      user.update(name: params[:name], email: params[:email])
      user.password = params[:password] if !params[:password].empty?
      user.save
      session[:username] = user.name 
      flash[:success] = "Profile successfully updated." 
      redirect to '/'
    else
      flash[:error] = "Unable to update your profile. Please try again." 
      redirect to '/users/edit'
    end
  end

end