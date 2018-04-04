require 'aws-sdk'

# retrieve the access key and secret key
access_key_id = ENV["AWS_ACCESS_KEY_ID"]
secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
bucket_name = ENV["S3_BUCKET"]

# create an instance of the s3 client
s3 = AWS::S3.new(access_key_id: access_key_id, secret_access_key: secret_access_key)

# get the bucket
bucket = s3.buckets[bucket_name]

# retrieve the objects
bucket.objects.each do |object|
  puts object.key
  puts object.read
end