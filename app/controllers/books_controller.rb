class BooksController < ApplicationController

   before_action :authenticate_user!,except: [:home]

    def new
      @book = Book.new
      @user = User.new
    end

    def home
    end

    def edit
       @book = Book.find(params[:id])
    end


    def update
       book = Book.find(params[:id])
       book.update(book_params)
       redirect_to book_path(book.id)
    end


    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @books = Book.all
      @user = current_user
      if @book.save
         redirect_to book_path(@book.id), :notice => "New book was successfully created"
      else
        render :index
      end

    end

    def index
      @book = Book.new
      @books = Book.all
      @user = current_user
    end

    def show
      @book = Book.find(params[:id])
      @book_new =Book.new
      @user = @book.user
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end


    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
