class Act < ActiveRecord::Base

  has_many :shows

  def slug
    self.name.strip.downcase.gsub(' ','-')
  end
  
  def find_by_slug(arg)
    self.all.find{|inst| inst.slug == arg}
  end
end