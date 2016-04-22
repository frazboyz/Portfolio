module ApplicationHelper

  # Returns true if the user is logged in else false.
  def logged_in
    session[:user_id] != nil
  end
    
  # Returns true if the logged in user is an admin else false
  def admin_logged_in
    if session[:user_id] == nil
      return false
    end
    return User.find_by_id(session[:user_id]).admin
  end

  # Returns the currently logged in user model.
  def get_user
      User.find_by_id(session[:user_id])
  end

  # A usefull before action to redirect the user to the login
  # if the user has not logged in yet and is required to.
  def require_authentication
    unless logged_in
      redirect_to :controller => :admin, :action => :login
    end
  end
    
  # A usefull before action to redirect the user to the login
  # if the user has not logged in yet and is required to.
  def require_admin_authentication
    unless logged_in && get_user.admin
      redirect_to :controller => :admin, :action => :login
    end
  end

end
