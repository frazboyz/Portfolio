class AccessController < ApplicationController

  def login
    user = User.find_by_username(params[:username]);
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => :application
  end

  private

  def attempt_login
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end
  end

end
