class ProjectsController < ApplicationController

  layout "application", :only => [:index, :show]
  layout "admin", :only => [:new, :create, :delete, :destroy]
  before_action :logged_in, :only => [:new, :create, :delete, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def delete
  end

  def destroy
  end

end
