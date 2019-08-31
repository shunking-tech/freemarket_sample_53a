require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      region: 'ap-northeast-1',
      use_iam_profile: true
    }
    config.fog_directory  = 'freemarket-sample-53a'
    config.asset_host = "https://#{config.fog_directory}.s3-ap-northeast-1.amazonaws.com"
  else
    config.storage = :file
  end
end