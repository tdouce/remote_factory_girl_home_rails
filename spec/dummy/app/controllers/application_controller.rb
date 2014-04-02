class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate, :another_authentication

  def authenticate
    redirect_to '/401.html'
  end

  def another_authentication
    redirect_to '/401.html'
  end
end
