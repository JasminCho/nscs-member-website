class PhotosController < ApplicationController
  def new
  end

  def create
    # Make an object in your bucket for your upload
    obj = S3_BUCKET.objects[params[:file].original_filename]

    # Upload the file
    obj.write(
      file: params[:file],
      acl: :public_read,
      storage_class: "REDUCED_REDUNDANCY"
    )

    # Create an object for the upload
    @photo = Photo.new(
    		url: obj.public_url,
		    name: obj.key
    	)

    # Save the upload
    if @photo.save
      redirect_to photos_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
    @photos = Meeting.all
    @photos.each do |s3_item|
      unless S3_BUCKET.objects[s3_item.name].exists?
        @photos.delete(s3_item)
      end 
    end 
  end
end  