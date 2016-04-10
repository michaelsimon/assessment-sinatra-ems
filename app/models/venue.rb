class Venue < ActiveRecord::Base
  validates_presence_of :name, :address, :zipcode, :phone, :email, :website
  has_many :shows
  belongs_to :user

end