class Milestone < ActiveRecord::Base

  # Used to order results based off the date of the milestone
  default_scope {order('date DESC')}

  mount_uploader :image, MilestoneImageUploader

end
