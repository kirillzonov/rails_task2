RailsTask2::Application.routes.draw do
    root :to => 'home#index'
  resources :users, :only => [ :new, :create, :show, :edit, :update]
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :posts, :only => [ :new, :create, :show, :index] do
    resources :votes, :only => :create
    resources :comments, :only => [ :new, :create ]
  end
end
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    
    when /login page/
      'login'

    when /register page/
      new_user_path

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
