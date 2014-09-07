class SessionsController < ApplicationController
  def create
    user = User.find_by_login(params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      #sign_in user
      redirect_to controller: 'pages', action: 'home'
    else
      # Create an error message and re-render the signin form
#      flash.now[:error] = 'Неверные логин / пароль' # Not quite right!
      render 'new'
    end
  end

  def new
  end

  def destroy
  end
end
