class Post < ActiveRecord::Base
  belongs_to :category
  validates :theme, :presence => true
  validates :content, :presence => true
end
