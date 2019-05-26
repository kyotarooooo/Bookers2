class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]

	def top
	end


	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end


	def show
		@book = Book.new
		user = User.find(params[:id])
		@books = user.books
		@user = User.find(params[:id])
	end

	def create
  	 	if @book.save
        	flash[:notice] = "You have creatad book successfully."
  	  	 	redirect_to book_path(@book.id)
     	else
      		@books = Book.all
     		@new_book = Book.new
      		@user = current_user
			render :index
     	end
    end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
		redirect_to user_path(@user.id)
		else
        	flash.now[:error] = @user.errors.full_messages
        render :'users/edit'
    end
	end



	private

	def book_params
  	  params.require(:book).permit(:title, :body,)
    end
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
	def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
    end

end
