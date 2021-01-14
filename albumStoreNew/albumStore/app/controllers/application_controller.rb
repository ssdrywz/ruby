class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :forwarding_url

  def current_user
    @current_user ||= User.find(session[:current_userid]) if session[:current_userid]
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url]||default)
    session.delete(:forwarding_url)
  end



end
