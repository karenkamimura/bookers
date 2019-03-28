class UsersController < ApplicationController
	 before_action :authenticate_user!

   def new
    @book = Book.new
    @user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  	 @user = User.find(params[:id])
  	end

  	def index
  		 @book = Book.new
       @books = Book.all
       @book_user = User.all
       @user = current_user
  	end

  	def new
  		@user = User.new
  	end

  	def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      redirect_to book_path(@book.id), :notice => "New book was successfully created"
  		@user = User.new(user_params)
  		@user.save
  		redirect_to @user
  	end
  	def destroy
  	end

  	def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
      end

  	def user_params
  		params.require(:user).permit(:username, :profile_image, :introduction)
  	end

end