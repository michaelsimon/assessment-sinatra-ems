class Show < ActiveRecord::Base

  belongs_to :act
  belongs_to :venue
  belongs_to :user

end