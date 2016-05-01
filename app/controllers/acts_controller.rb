class ActsController < ApplicationController

  get '/acts/?', :auth => true do
    @acts = Act.all
    erb :"acts/index"
  end

  get '/acts/new/?', :auth => true do
    erb :"acts/new"
  end

  get '/acts/:slug/?', :auth => true do
    @act = Act.find_by_slug(params[:slug])
    if @act
      erb :"acts/detail"
    else
      flash[:error] = "Unable to find act, please try again."
      redirect to '/acts'
    end
  end

  get '/acts/:slug/edit/?', :auth => true do
    @act = Act.find_by_slug(params[:slug])
    if @act
      if @act.user_id == session[:user_id]
        erb :"acts/edit"
      else
        flash[:error] = "You are unable to edit an act you did not create." 
        redirect to '/acts'
      end
    else
      flash[:error] = "Unable to find act, please try again."
      redirect to '/acts'
    end
  end

  get '/acts/:slug/delete/?', :auth => true do
    @act = Act.find_by_slug(params[:slug])
    if @act
      if @act.user_id == session[:user_id]
        @act.delete
        flash[:success] = "Act deleted." 
      else
        flash[:error] = "You are unable to delete an act you did not create." 
        redirect to '/acts'
      end
    else
      flash[:error] = "Act not found." 
    end
    redirect to '/acts'
  end

  post '/acts', :auth => true do 
    @act = Act.create(params)
    if @act
      redirect to "/acts/#{@act.slug}"
    else
      flash[:error] = "Unable to create act, please try again, ensuring all fields are filled out." 
      redirect to '/acts/new'
    end
  end

  post '/acts/:slug', :auth => true do
    @act = Act.find_by_slug(params[:slug])
    if @act
      if @act.update(name: params[:name], description: params[:description], size: params[:size], location: params[:location], website: params[:website])
        redirect to "/acts/#{@act.slug}"
      else
        flash[:error] = "Unable to update act, please try again."
        redirect to "/acts/#{params[:slug]}/edit"
      end
    else
      flash[:error] = "Act not found." 
      redirect to '/acts'
    end
  end
  
end