class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :top, :show, :edit]

  def index
  end

  def show
     @user = User.find(params[:id]) 
     @book = Book.new
     @userbook = @user.books
  end


  def new
     @book = Book.new
     @users = User.all
  end

  def create
    @user = User.new(user_params[:id])
    if @user.save
      # user page redirect
      redirect_to user_path(current_user.id),  notice: 'successfully'
    else
      render 'edit'
    end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # user page redirect
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

private
def user_params
    params.require(:user).permit(:name, :profile_image)
end


 private

def user_params
      params.require(:user).permit(:name, :profile, :image )
end

end
