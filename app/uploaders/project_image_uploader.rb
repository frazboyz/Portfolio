class ProjectImageUploader < CarrierWave::Uploader::Base

  if Rails.env.development?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
