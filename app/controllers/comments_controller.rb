class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create( params[:comment] )
    #redirect_to post_path( @post )
    
    respond_to do |format|
      format.js
    end
  end
end
