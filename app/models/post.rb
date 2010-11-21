class Post < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :theme, :content
#  validates :theme, :presence => true
#  validates :content, :presence => true
end
