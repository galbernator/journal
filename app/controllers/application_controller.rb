class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  private

  def require_current_user
    redirect_to :login unless current_user.present?
  end

end
