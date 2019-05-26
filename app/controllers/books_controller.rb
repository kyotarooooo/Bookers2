class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def top
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
  	  @book = Book.new(book_params)
      @book.user_id = current_user.id
  	  if @book.save
        flash[:notice] = "You have creatad book successfully."
  	   redirect_to book_path(@book.id)
     else

      @books = Book.all
      @new_book = Book.new
      @user = current_user
      flash.now[:error] = "error:Post failure"

       render :index
     end
  end

  def update
  	@book = Book.find(params[:id])
  if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
  	   redirect_to book_path(@book.id)
  else
       render :'books/edit'
  end
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
  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end


end
