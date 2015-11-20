class Project < ActiveRecord::Base
  mount_uploader :image, ProjectImageUploader
end
