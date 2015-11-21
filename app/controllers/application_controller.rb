class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Standard application layout
  layout "application"

  # A few helper methods to assist controllers and templates.
  include ApplicationHelper

  # GET http://francismb.com/
  def index
  end

end
