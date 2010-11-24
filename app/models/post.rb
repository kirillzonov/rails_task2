class Post < ActiveRecord::Base
  belongs_to :category, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  validates_presence_of :theme, :content

  def voted_from?(ip)
    !self.votes.where(:user_ip => ip).empty?
  end
  def change_rate(dir) 
    !self.update_attribute(:rate, self.rate + dir ) 
  end
end
