class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book, successfully."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end
    redirect_to books_path
  end

  def index
    @books = Boook.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Boook.find(params[:id])
  end

  def update
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
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book_).permit(:title, :body)
  end

end
