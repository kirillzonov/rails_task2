class PostsController < ApplicationController
  before_filter :current_user
  before_filter :logged_in?, :only => :new  
  inherit_resources
  action :all
end
