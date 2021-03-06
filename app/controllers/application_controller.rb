class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :not_logged_in
  protect_from_forgery with: :exception


  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||=
      User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def not_logged_in
    redirect_to new_session_url if !logged_in?
  end
end
