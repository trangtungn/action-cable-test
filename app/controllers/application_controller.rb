class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  protected

  def authenticate_user!
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= begin
      return nil unless session[:user_id]

      user = User.find(session[:user_id])
      cookies.signed[:user_id] = user.id

      user
    end
  end

  private

  def logged_in?
    !!current_user
  end
end
