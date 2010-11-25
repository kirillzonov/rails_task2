class HomeController < ApplicationController
  def index
    @posts = Post.where('rate >= ?', 0).paginate(:page => params[:page], :per_page => 5)
    @user_id = session[:user_id]

    if @user_id
      @user_email = User.find(@user_id).email
    end
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @posts }
    end
  end
end
