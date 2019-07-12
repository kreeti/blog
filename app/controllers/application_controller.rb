class ApplicationController < ActionController::Base
  include SessionsHelper

  helper_method :current_user, :correct_user

  def correct_user(post_or_comment)
    @user = post_or_comment.user
    if @user == current_user
      return true
    else
      return false
    end
  end

  def login_required
    unless logged_in?
      flash[:error] = "You must first log in or sign up before accessing this page."
      redirect_to login_path
    end
  end
end
