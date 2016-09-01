class UsersController < ApplicationController
  skip_before_action :require_current_user, only: [:new, :create]
  before_action :set_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit([
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      ])
  end

  def set_user
    @user = User.find params[:id] || current_user
  end

end
