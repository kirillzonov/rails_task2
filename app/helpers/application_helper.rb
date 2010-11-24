module ApplicationHelper
  def logged
    if @user_id 
      render 'layouts/logged'
      else
      render 'layouts/anonim'
    end
end
  def user_voted?(post_id)
    Votes.where(:post_id => post_id, :user_ip => request.env['REMOTE_ADDR']).empty? ? true : false
  end
end
