class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if !current_user || current_user.id.to_s != params[:id].split('-').first
      flash[:alert] = "You must be logged in."
      redirect_to login_path
    end
  end

end
