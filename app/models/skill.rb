class Skill < ActiveRecord::Base

  validates :name, :presence => {:message => 'The name field cannot be blank'}
  validates :color, :presence => {:message => 'The name color cannot be blank'}
  validates :summary, :presence => {:message => 'The name summary cannot be blank'}
  validates :content, :presence => {:message => 'The name content cannot be blank'}
  validates :knowledge, :presence => {:message => 'The name knowledge cannot be blank'}

end
