class HomeController < ApplicationController
  before_filter :current_user
  before_filter :logged_in?
  inherit_resources
  action :index
  
  protected
    def collection
    @posts = Post.high_rate.paginate(:page => params[:page], :per_page => 5)
    end
end
