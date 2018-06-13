# app/uploaders/photo_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Remove everything else
end
