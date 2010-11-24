module PostsHelper
  def user_voted?(post_id)
    Votes.where(:post_id => post_id, :user_ip => request.env['REMOTE_ADDR']).empty? ? true : false
  end
end
