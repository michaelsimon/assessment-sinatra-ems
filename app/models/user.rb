class User < ActiveRecord::Base
  validates_presence_of :name, :email
  has_many :shows
  has_many :venues
  has_many :acts
  has_secure_password
  
end