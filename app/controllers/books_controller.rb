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
      redirect_to books_path
      flash[:notice] = "successfully"
    else
      @user = User.find(current_user.id)
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id)
      flash[:notice] = "successfully"
    else
      @book = Book.find(params[:id])
      render :show
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    #   flash[:notice] = "successfully"
    # else
    #   redirect_to books_pash
    # end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
