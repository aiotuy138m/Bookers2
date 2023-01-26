class UsersController < ApplicationController
  def index
    @user =User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_show_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
