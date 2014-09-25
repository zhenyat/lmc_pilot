class Admin::PanelController < ApplicationController
  layout 'admin'
  def index
    @user = User.find session[:user_id]
    if @user.department.number != '99'
      redirect_to '/pages/home'
    end
  end
end
