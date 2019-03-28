class BookImageController < ApplicationController
=begin
	def new
		@book_image = BookImage.new
    end

    def create
    	@book_image = BookImage.new(book_image_params)
        @book_image.user_id = current_user.id
        @book_image.save
        redirect_to book_images_path
    end

    def index
    	@book_images = BookImage.all
    end

    def show
    	@book_image = BookImage.find(params[:id])
    end

    private
    def book_image_params
        params.require(:book_image).permit(:book_name, :image, :caption)
    end
    =end
end
