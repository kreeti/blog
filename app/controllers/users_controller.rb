class UsersController < ApplicationController
  before_filter :login_required, on: [:edit, :update]
  before_filter :correct_user, on: [:edit, :update]

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
      redirect_to root_path
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

  def correct_user
    binding.pry
    @user = User.find(params[:id])
    if current_user
      flash[:warning] = "You are not authorized"
      redirect_to posts_path
    else
      flash[:warning] = "You must Log in first"
      redirect_to(root_url) unless @user == current_user
    end
  end
end
