#aws.rb

AWS.config(
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
)

S3_CLIENT = AWS::S3::Client.new(region: ENV['S3_REGION'])
S3_RESOURCE = Aws::S3::Resource.new(client: S3_CLIENT)
S3_BUCKET =  AWS::S3.new.buckets[ENV['S3_BUCKET']]
S3_RESOURCE_REGION_BASED = Aws::S3::Resource.new(region: ENV['S3_REGION'])
