class Skill < ActiveRecord::Base

  validates :name, :presence => {:message => 'The name field cannot be blank'}
  validates :color, :presence => {:message => 'The color field cannot be blank'}
  validates :summary, :presence => {:message => 'The summary field cannot be blank'}
  validates :content, :presence => {:message => 'The content field cannot be blank'}
  validates :knowledge, :presence => {:message => 'The knowledge field cannot be blank'}

  has_and_belongs_to_many :projectsss

end
