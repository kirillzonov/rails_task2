class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @user_id = session[:user_id]
    if @user_id
      @user_email = User.find(@user_id).email
    end
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(:root) }
      format.xml  { head :ok }
    end
  end

  def voteup
    @post = Post.find(params[:post_id])
    @post.rate += 1
    @post.save
   respond_to do |format|
      format.html { redirect_to :root} 
      format.js
      format.xml  { render :xml => @post }
   end
  end

  def votedown
    @post = Post.find(params[:post_id])
    @post.rate -= 1
    @post.save
    session[:user_id]
    respond_to do |format|
      format.html { redirect_to :root} 
      format.js
      format.xml  { render :xml => @post }
    end

  end
end
