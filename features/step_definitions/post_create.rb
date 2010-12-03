Given /^a user exist with an email "([^""]*)"/ do |email|
  User.create!(:email => email, :password => 'password')
end
Given /^I am logged in as "([^""]*)"$/ do |email|
  Given %{I am on the login page}
  When %{I fill in "email" with "graff@fs.com"}
  And %{I fill in "password" with "password"}
  And %{I press "login"} 
end  
Then /^check number of posts$/ do
  if Post.count > @post_number
    puts 'Post added!'
  else
    puts 'Something wrong'
  end
end
Given /^a category exists with a name "([^""]*)"$/ do |category|
  Category.create!(:name => category)
end
Given /^we know number of posts$/ do
  @post_number = Post.count
end

