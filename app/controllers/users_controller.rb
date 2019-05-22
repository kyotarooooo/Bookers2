class UsersController < ApplicationController

	before_action :authenticate_user!, except: [:top]

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

	def correct_user
    user = User.find(params[:id])
  end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
