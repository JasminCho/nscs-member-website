class PhotosController < ApplicationController
    include S3ModuleHelper

  def new
  end

  def create
  end

  def index
    @photos = []
    S3ModuleHelper::s3_get_objects(ENV['S3_BUCKET2']).each do |photo|
      S3_CLIENT.put_object_acl({
        acl: "public-read",
        bucket_name: ENV['S3_BUCKET2'],
        key: photo,
      })
      @photos << S3ModuleHelper::s3_get_file_url(photo, ENV['S3_BUCKET2'])
    end
  end


end  