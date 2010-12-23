class Post < ActiveRecord::Base
  belongs_to :category, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  validates_presence_of :theme, :content
  scope :high_rate, where('rate >= ?', 0)
  before_save :default_values

  def default_values
    self.source = '' unless self.source
    self.tags = '' unless self.tags
  end
  def voted_from?(ip)
    !self.votes.where(:user_ip => ip).empty?
  end
  def change_rate(dir) 
    !self.update_attribute(:rate, self.rate + dir ) 
  end
end
