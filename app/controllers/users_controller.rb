class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create]

  def new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Successfully Created!"
      redirect_to posts_path
    else
      flash[:warning] = "User Not Created!"
      redirect_to new_user_path
    end
  end

  def show
    @posts = Post.where(user: current_user)
  end

  def edit
  end

  def update
  end

  private


end
