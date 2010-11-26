class Post < ActiveRecord::Base
  belongs_to :category, :dependent => :destroy
  belongs_to :user
  has_many :votes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  validates_presence_of :theme, :content, :user

  def voted_from?(ip)
    !self.votes.where(:user_ip => ip).empty?
  end
  def change_rate(dir) 
    !self.update_attribute(:rate, self.rate + dir ) 
  end
end
