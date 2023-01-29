class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book, successfully."
      redirect_to book_path(book.id)
    else
      @books=Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @user = @book.user
  end

  def edit
    @user = current_user
    @book = Book.find(params[:id])
  end

  def update
    @user = current_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have update user successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:notice]="本当に消しますか？"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
