class AdminController < ApplicationController

  layout "admin"
  before_action :require_authentication, :only => [:index, :projects, :blogs]

  def index
    redirect_to :action => :blogs
  end

  def projects
  end

  def blogs
    @posts = Post.all
  end

  def login
    if logged_in
      redirect_to :action => :index
    end
  end

  def process_login
    user = User.find_by_username(params[:username]);
    if user && user.authenticate(params[:password])
      flash[:error] = nil
      session[:user_id] = user.id
      redirect_to :action => :index
    else
      flash[:error] = "Failed to login, please try again."
      render :action => :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => :application
  end

end
