module ApplicationHelper
  def logged
    render logged_in? ? 'layouts/logged' : 'layouts/anonim', :user => @current_user
  end
end
