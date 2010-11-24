class Vote < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :user_ip, :post_id
end
