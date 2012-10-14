class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  process :resize_to_fit => [1024, 1024]

  storage :file

  version :thumb do
    process :resize_to_fit => [150,150]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(gif png jpeg jpg)
  end
end
