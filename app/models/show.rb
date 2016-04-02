class Show < ActiveRecord::Base

  validates_presence_of :name

  belongs_to :act
  belongs_to :venue
  belongs_to :user

  def fmatdate
    self.show_date.strftime("%a %m/%d/%Y")
  end

  def fmattime
    self.show_time.strftime("%I:%M %p")
  end

end