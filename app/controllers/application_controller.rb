class ApplicationController < ActionController::Base
  include SessionsHelper

  helper_method :current_user



  def login_required
    unless logged_in?
      flash[:error] = "You must first log in or sign up before accessing this page."
      redirect_to login_path
    end
  end
end
