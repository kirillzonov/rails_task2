module ApplicationHelper
  def logged
    render logged_in? ? 'layouts/logged' : 'layouts/anonim'
  end
end
