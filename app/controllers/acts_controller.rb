class ActsController < ApplicationController

  get '/acts/?', :auth => :user_id do
    @acts = Act.all
    erb :"acts/index"
  end

  get '/acts/new/?', :auth => :user_id do
    erb :"acts/new"
  end

  get '/acts/:slug/?', :auth => :user_id do
    @act = Act.find_by_slug(params[:slug])
    if @act
      erb :"acts/detail"
    else
      flash[:error] = "Unable to find act, please try again."
      redirect to '/acts'
    end
  end

  get '/acts/:slug/edit/?', :auth => :user_id do
    @act = Act.find_by_slug(params[:slug])
    if @act
      erb :"acts/edit"
    else
      flash[:error] = "Unable to find act, please try again."
      redirect to '/acts'
    end
  end

  get '/acts/:slug/delete/?', :auth => :user_id do
    @act = Act.find_by_slug(params[:slug])
    if @act
      @act.delete
      flash[:success] = "Act deleted." 
    else
      flash[:error] = "Act not found." 
    end
    redirect to '/acts'
  end

  post '/acts', :auth => :user_id do 
    @act = Act.create(params)
    if @act.valid?
      redirect to "/acts/#{act.slug}"
    else
      flash[:error] = "Unable to create act, please try again, ensuring all fields are filled out." 
      redirect to '/acts/new'
    end
  end
  post '/acts/:slug/?', :auth => :user_id do
    @act = Act.find_by_slug(params[:slug])
    if @act
      if @act.update(params.except!("splat","captures")).valid?
        redirect to "/acts/#{act.slug}"
      else
        flash[:error] = "Unable to update act, please try again." 
        redirect to "/acts/#{params[:slug]/edit}"
      end
    else
      flash[:error] = "Act not found." 
      redirect to '/acts'
    end
  end
  
end