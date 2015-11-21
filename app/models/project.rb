class Project < ActiveRecord::Base

  validates :name, :presence => {:message => 'The name field cannot be blank'}
  validates :summary, :presence => {:message => 'The summary field cannot be blank'}
  validates :content, :presence => {:message => 'The content field cannot be blank'}
  validates :image, :presence => {:message => 'The image field cannot be blank'}

  mount_uploader :image, ProjectImageUploader

end
