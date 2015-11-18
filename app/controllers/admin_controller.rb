class AdminController < ApplicationController

  layout "admin"
  before_action :require_authentication, :only => [:index, :projects, :blogs]

  def index
    redirect_to :action => :login
  end

  def login
    if logged_in
      redirect_to :controller => :application, :action => :index
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => :application
  end

  def authenticate
    user = User.find_by_username(params[:username]);
    if user && params[:password] === 'testing'
      flash[:error] = nil
      session[:user_id] = user.id
      redirect_to :controller => :application, :action => :index
    else
      flash[:error] = 'Failed to login, please try again.'
      render :action => :login
    end
  end

end
