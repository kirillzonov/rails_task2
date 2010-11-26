class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :content, :user
  validates_length_of :user, :in => 3..20,
                        :too_long => 'Your name is longer than 20 symbols? 0_o',
                        :too_short => '2 symbols? Name? Ha!'
  validates_length_of :content, :maximum => 255,
                        :too_long => 'It`s too long to be a comment'
end
