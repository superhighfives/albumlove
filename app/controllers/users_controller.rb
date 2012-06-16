class UsersController < ApplicationController
  before_filter :signed_in_user,        only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,          only: [:edit, :update]
  before_filter :admin_user,            only: [:destroy]
  before_filter :avoid_destroy_self,    only: [:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end
  def new
    if signed_in?
      flash[:error] = "You're already logged in"
      redirect_to root_path
    end
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  def create
    if signed_in?
      flash[:error] = "You're already logged in"
      redirect_to root_path
    end
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Albumlove"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  private

    def avoid_destroy_self
      @user = User.find(params[:id])
      redirect_to users_path, :notice => "You can't delete yourself" unless !current_user?(@user)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end