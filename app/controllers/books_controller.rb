class BooksController < ApplicationController
  def top
    @book = Book.new
  end

  def new
  end

  def show
    @new_book = Book.new
  	@book = Book.find(params[:id])
    @books = Book.all
  end

  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def create
      @books = Book.all
      @new_book = Book.new
      @user = current_user
  	  book = Book.new(book_params)
      book.user_id = current_user.id
  	  if book.save
        flash[:notice] = "You have creatad book successfully."
  	   redirect_to book_path(book.id)
     else
        flash.now[:error] = book.errors.full_messages

       render :'books/index'
     end
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body,)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
