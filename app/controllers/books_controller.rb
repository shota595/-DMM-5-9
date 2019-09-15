class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    
  end

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      @user = User.find(current_user.id)
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    if current_user != @user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
    @favorite = Favorite.new
  end

  def destroy
    book = Book.find(params[:id])
    user = User.find(book.user.id)
    if current_user != user
      redirect_to books_path
    else
      book.destroy
      redirect_to books_path
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
