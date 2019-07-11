module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    current_user
  end

  def login(user)
    session[:user_id] = user.id
    current_user
  end
end
