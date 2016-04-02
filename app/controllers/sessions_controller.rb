class SessionsController < ApplicationController


  get '/sessions/login/?' do
    erb :"sessions/login"
  end

  post '/sessions/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:username] = user.name 
      redirect to '/'
    else
      flash[:error] = "Invalid username or password, please try again." 
      redirect to '/sessions/login'
    end
  end


 get '/sessions/logout', :auth => :user_id do
    session.clear
    flash[:success] = "You are now logged out." 
    redirect to '/'
  end

end