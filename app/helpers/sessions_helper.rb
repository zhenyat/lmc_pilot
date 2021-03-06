module SessionsHelper

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Logs in the given user.
  def log_in user
    session[:user_id]  = user.id
    if user.manager?
      session[:manager_id] = user.id
    else
      session[:manager_id] = nil
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
