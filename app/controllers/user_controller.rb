class PostController < ApplicationController
  def index
  end

  def show
  #      @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(post_image_params[:id])
    @user.save
    redirect_to new_user_path
end

  def edit
    @user = User.find(params[;id])
  end

  def update
        current_user.update(post_params)
        redirect_to new_user_path
  end

 private

def post_params
      params.require(:user).permit(:name, :profile)
  end

end
