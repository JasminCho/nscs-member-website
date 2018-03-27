require 'aws-sdk-s3'  # v2: require 'aws-sdk'
require 'json'

profile_name = 'julian'
region = "us-west-2"
bucket = '431project'
my_bucket = 'david-cloud'

# S3

# Configure SDK
s3 = Aws::S3::Client.new(profile: profile_name, region: region)

# Display a List of Amazon S3 Buckets
resp = s3.list_buckets
resp.buckets.each do |bucket|
  puts bucket.name
end