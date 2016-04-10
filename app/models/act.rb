class Act < ActiveRecord::Base
  validates_presence_of :name, :description, :size, :location, :website

  has_many :shows
  belongs_to :user

  def slug
    self.name.strip.downcase.gsub(' ','-')
  end
  
  def self.find_by_slug(arg)
    self.all.find{|inst| inst.slug == arg}
  end
end