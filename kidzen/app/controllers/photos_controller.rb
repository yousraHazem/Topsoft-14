class PhotosController < ApplicationController

  # This method is used to Allow accessing model attributes As Rails 4 does
  # not support "attr_accessible" keyword
  # Parameters : None
  # Returns : None
  # Approach : The method is  just making The model's column accessible
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy 
  def photo_params
    params.require(:photo).permit(:description, :image, :remote_image_url)
  end

  # This method used to assign all the photos in the database 
  # to variable @photos in order to view them in the index page
  # Parameters : None
  # Returns : None
  # Approach : Just returning all the records in photos table
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def index
    @photos = Photo.all
  end
    
  # This method used to initialize new photo and assign it to variable
  # @photo in order to access it in new view
  # Parameters : None
  # Returns : None
  # Approach : Just creates new Instance of photo
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy
  def new
    @photo = Photo.new
  end

  # This method used to assign photo using it's id to variable @photo in order to view it
  # Parameters : None
  # Returns : None
  # Approach : Select photo record using it's id
  # Time Complexity : Unknown (database Query)
  # Author : Hussien M. Eloy
  def show
    @photo = Photo.find(params[:id])
  end

  # This method used to initialize new photo using its parameters 
  # and assign it to variable @photo and trying to save it 
  # in order to access it in form view to create
  # Parameters : None
  # Returns : None
  # Approach : Just creates new Instance of photo
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to @photo
    else
      render :action => 'new'
    end
  end

  # This method used to assign photo using it's id to variable @photo in order to use it
  # in edit action in form view
  # Parameters : None
  # Returns : None
  # Approach : Select photo record using it's id
  # Time Complexity : Unknown (database Query)
  # Author : Hussien M. Eloy
  def edit
    @photo = Photo.find(params[:id])
  end

  # This method used to assign photo using it's id to variable @photo in order to use it
  # in update action in form view and check if it is really updated
  # Parameters : None
  # Returns : None
  # Approach : Select photo record using it's id
  # Time Complexity : Unknown (database Query)
  # Author : Hussien M. Eloy
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      flash[:notice] = "Successfully updated photo."
      redirect_to photo_url
    else
      render :action => 'edit'
    end
  end
     
  # This method used to assign photo using it's id to variable @photo in order to use it
  # in destroy action in form view
  # Parameters : None
  # Returns : None
  # Approach : Select photo record using it's id
  # Time Complexity : Unknown (database Query)
  # Author : Hussien M. Eloy 
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to photos_url
  end
end
