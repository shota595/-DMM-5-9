class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :current_user, only: [:edit, :update]
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @follow = Relationship.new
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
      flash[:notice] = "successfully"
    else
      render 'edit'
    end
  end

  def followings
    @user = User.find(params[:id])
    # @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    # @users = @user.followers

  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
