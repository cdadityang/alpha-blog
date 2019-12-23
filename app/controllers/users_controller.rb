class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :already_login, only: [:new, :create]
  
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Welcome to ALpha Blog #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(users_params)
      flash[:success] = "User #{@user.username} Updated Successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def show
    
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @user.destroy
    session[:user_id] = nil if !current_user.admin?
    flash[:danger] = "User was deleted!"
    redirect_to users_path
  end
  
  
  private
  def users_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
      if current_user != @user && !current_user.admin?
         flash[:danger] = "You cannot change settings of other users"
         redirect_to users_path
      end
  end
  
  def already_login
    if logged_in?
      flash[:danger] = "You're already logged in, Why sign up?"
      redirect_to user_path(current_user)
    end
  end
  
end
