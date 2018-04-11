class MeetingsController < ApplicationController
  def new
  end

  def create
    obj = S3_BUCKET.objects[params[:file].original_filename]
    
    obj.write(
      file: params[:file],
      acl: :public_read
    )

    @meeting = Meeting.new(
			url: obj.public_url,
			date: obj.key
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


  end
end