class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Standard application layout
  layout "application"

  # A few helper methods to assist templates in rendering.
  helper_method :logged_in, :get_user

  # GET http://francismb.com/
  def index
  end

  private

  # Returns true if the user is logged in else false.
  def logged_in
    session[:user_id] != nil
  end

  # Returns the currently logged in user model.
  def get_user
    user.find_by_id(session[:user_id])
  end

  # A usefull before action to redirect the user to the login
  # if the user has not logged in yet and is required to.
  def require_authentication
    unless logged_in
      redirect_to :controller => :admin, :action => :login
    end
  end

end
