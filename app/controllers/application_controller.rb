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
      session[:user_id]
    end
  end

set(:auth) do |boolean| 
    condition do
      if !logged_in? && boolean == true
        flash[:error] = "Please login to perform this action." 
        redirect to '/sessions/login' 
      end
    end
  end

end