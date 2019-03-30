class UsersController < ApplicationController
	 before_action :authenticate_user!,except: [:about]

   def about
   end

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
       @book_user = User.all
       @user = current_user
  	end

  	def destroy
  	end

  	def update
       @user = User.find(params[:id])
       @user.update(user_params)
       if @user.save
          redirect_to user_path(@user.id), :notice => "New profile was successfully created"
       else
          render :edit
        end

      end

  	def user_params
  		params.require(:user).permit(:username, :profile_image, :introduction)
  	end

end