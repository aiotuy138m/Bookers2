class UsersController < ApplicationController
  def index
    @user =User.all
  end

  def show
    @user = current_user
    @books = @user.book
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
    params.require(:user).permit(:name, :introduction)
  end
 
end
