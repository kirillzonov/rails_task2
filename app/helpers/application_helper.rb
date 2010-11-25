module ApplicationHelper
  def logged
    if @user_id 
      render 'layouts/logged'
      else
      render 'layouts/anonim'
    end
  end
end
