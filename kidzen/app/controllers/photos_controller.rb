class PhotosController < ApplicationController

	def photo_params
		params.require(:photo).permit(:description, :image, :remote_image_url)
	end

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			flash[:notice] = "Successfully created photo."
			redirect_to @photo
		else
			render :action => 'new'
		end
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
        if @photo.update_attributes(params[:photo])
            flash[:notice] = "Successfully updated photo."
            redirect_to photo_url
        else
            render :action => 'edit'
        end
	end

	def  destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		flash[:notice] = "Successfully destroyed photo."
		redirect_to photos_url
	end
end
