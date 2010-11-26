class VotesController < ApplicationController
  def create
    ip = request.remote_ip
    post = Post.find(params[:post_id])

    unless post.voted_from?(ip) #(params[ip])
      Vote.create(:post_id => params[:post_id], :user_ip => ip)
#      if params[:direction] == '+'
      if params[:vote_up]
        post.change_rate(1)
      end
      if params[:vote_down]
        post.change_rate(-1)
      end
      post.save
    text = "You`ve successfully voted!"
    else
    text = "you`ve already voted"
    end
       @post = Post.find(params[:post_id])
    respond_to do |format|
      @text = text
      format.js
    end
  end
end
