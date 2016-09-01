class SessionsController < ApplicationController
  skip_before_action :require_current_user

  def new
    redirect_to :root if current_user
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

end
