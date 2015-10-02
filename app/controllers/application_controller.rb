class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  private

  def logged_in
    session[:user_id] != nil
  end

  def get_user
    user.find_by_id(session[:user_id])
  end

end
