class HomeController < ApplicationController
  before_filter :current_user
  before_filter :logged_in?
    
  def index
    @posts = Post.where('rate >= ?', 0).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @posts }
    end
  end
end
