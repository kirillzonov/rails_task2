class UsersController < ApplicationController
  before_filter :current_user, :only => [:show, :edit, :update]
  before_filter :logged_in?, :only => [:show, :edit, :update]
  inherit_resources
end
