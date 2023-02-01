class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @book = Book.new
    @user_id = current_user
    @user = User.find(params[:id])
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
    @book = Book.new
  end

  def update
    @book = Book.new
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end


  private

def is_matching_login_user
  user_id = params[:id].to_i
  unless user_id == current_user.id
    redirect_to user_path(current_user)
  end
end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
