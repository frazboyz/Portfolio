class Message < ActiveRecord::Base

  validates :name, :presence => {:message => 'The name field cannot be blank'}
  validates :email, :presence => {:message => 'The email field cannot be blank'}
  validates :message, :presence => {:message => 'The message field cannot be blank'}

end
