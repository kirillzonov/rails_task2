class HomeController < ApplicationController
  def index
    @posts = Post.all
    @user_id = session[:user_id]
    if @user_id
      @user_email = User.find(@user_id).email
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
end
