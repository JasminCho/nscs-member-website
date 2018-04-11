class MeetingsController < ApplicationController
  def new
  end

  def create
    obj = S3_BUCKET.objects[params[:file].original_filename]
    
    obj.write(
      file: params[:file],
      acl: :public_read,
      storage_class: "REDUCED_REDUNDANCY"
    )

    @meeting = Meeting.new(
			url: obj.public_url,
			date: obj.key,
			name: obj.key
		)
    
    # Save the upload
    if @meeting.save
      redirect_to meetings_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
  	@meetings = Meeting.all
    @meetings.each do |s3_item|
    	unless S3_BUCKET.objects[s3_item.name].exists?
    		@meetings.delete(s3_item)
    	end	
    end	
  end

  def destroy
  	object_to_destroy = Meeting.find(params[:id])
  	S3_BUCKET.objects[object_to_destroy.name].delete
  	object_to_destroy.destroy
    flash[:success] = "Meeting deleted"
    redirect_to meetings_path
  end

end