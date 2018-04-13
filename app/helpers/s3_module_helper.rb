module S3ModuleHelper
#returns array of bucket names in our region, our region defined in config/initializers/aws.rb
# Use:     buckets = s3_get_buckets --> 'buckets' will have an array of the names of the S3 buckets on the account
  def self.s3_get_buckets
  	bucks = []
  	S3_RESOURCE.buckets.limit(50).each do |b|
  		bucks << b.name
  	end
  	return bucks
  end

#returns array populated with the objects in the bucket specified by the 'name' arg
#Use:      objects = s3_get_objects('nameOfBucket') --> 'objects' will have array of names/keys of objects inside the bucket specified
#Use:      objects = s3_get_objects(buckets[1]) --> you can use result from s3_get_buckets function to give name of bucket
  def self.s3_get_objects(bucket_name)
    objects = []
    s3 = Aws::S3::Resource.new(region: ENV['S3_REGION'])
    bucket = s3.bucket(bucket_name)
    if s3.bucket(bucket_name).exists?
      bucket = s3.bucket(bucket_name)
    else
      raise 'bucket does NOT exist'
    end
	#bucket = S3_RESOURCE_REGION_BASED.bucket(name) 
	#will DRY this out later ^^
    bucket.objects.limit(50).each do |item|
		  objects << item.key
    end
    return objects
  end

#returns public url for a certain item. will take bucket name as arg but if not provided, it will default to the one in onfig/initializers/aws.rb
#Use:       url = s3_get_file_url('health.html','nameOfBucket') --> 'url' will have the URL to the item inside of the bucket
#Use:       url = s3_get_file_url('health.html') --> if bucket name not given, it uses the bucket name in config/initializers/aws.rb 
#CAUTION: items that are not public will not be accessible from URL, but a URL can still be produced.
  def self.s3_get_file_url(file_key, bucket_name=ENV['S3_BUCKET'])
  	s3 = Aws::S3::Resource.new(region: ENV['S3_REGION'])
  	return s3.bucket(bucket_name).object(file_key).public_url
  end

end