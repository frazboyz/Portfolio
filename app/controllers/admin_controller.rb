class AdminController < ApplicationController

  layout "admin"
  
  # Shows the form to login.
  # GET http://francismb.com/admin/login
  def login
    if logged_in
      redirect_to :controller => :application, :action => :index
    end
  end

  # Logs the user out and redirects to the home page.
  # GET http://francismb.com/admin/logout
  def logout
    session[:user_id] = nil
    redirect_to :controller => :application
  end

  # Processes the form sent by #login and sets the
  # session id if the login gets successfully authenticated
  # else it renders the login again.
  # POST http://francismb.com/admin/authenticate
  def authenticate
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      flash[:error] = nil
      session[:user_id] = user.id
      redirect_to :controller => :application, :action => :index
    else
      flash[:error] = 'Failed to login, please try again.'
      render :action => :login
    end
  end

end
