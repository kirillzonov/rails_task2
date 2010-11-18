class HomeController < ApplicationController
  def index
    @posts = Post.all

  @user_id = session[:user_id]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
end
