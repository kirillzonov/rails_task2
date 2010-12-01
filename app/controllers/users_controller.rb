class UsersController < ApplicationController
  before_filter :current_user, :only => [:show, :edit, :update]
  before_filter :logged_in?, :only => [:show, :edit, :update]
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @user = @current_user
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:login, :notice => "User #{@user.email} was successfully created.") }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = @current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
