# TODO setup for testing
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                              # required
  config.fog_credentials = {
    provider:              'AWS',                              # required
    aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),     # required
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'), # required
    region:                'us-east-1',                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'projectjorge'                            # required
  config.fog_public     = true                                # optional, defaults to true
end
