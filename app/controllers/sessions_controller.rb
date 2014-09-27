class SessionsController < ApplicationController
  layout 'session'

  def create
    user = User.find_by_login(params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to controller: 'pages', action: 'home'
    else
      # Create an error message and re-render the signin form
#      flash.now[:error] = 'Неверные логин / пароль' # Not quite right!
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user           = nil
    session[:current_user]  = nil
    session[:manager_id]    = nil
    session[:position_id]   = nil
    session[:level_id]      = nil

    redirect_to new_session_path
  end


  def new
  end
end
