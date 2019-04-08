CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',  #required
    aws_access_key_id: ENV['AWS_S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_S3_SECRET_KEY'],
    region: ENV['AWS_S3_REGION'],
    path_style: true
  }
  config.fog_public     = true # public-read

  config.remove_previously_stored_files_after_update = false

  config.fog_directory = ENV['AWS_S3_BUCKET']
  if ImageUploader::storage == :fog
    config.asset_host = ENV['AWS_S3_URL']
  end

end
# 文字化け対策
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
