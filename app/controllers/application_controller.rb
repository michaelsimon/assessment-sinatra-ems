require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    use Rack::Flash
  end

  get "/" do
    erb :"index"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end
  end

def self.auth user_id
    condition do
      if !logged_in?
        flash[:notice] = "You must login to create a new show" 
        redirect to '/users/login' 
      end
    end
  end

end