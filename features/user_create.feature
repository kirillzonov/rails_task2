Feature: Create an User
  As an unregisterred user
  I want to register

Scenario:
  Given I am on register page
  Then show page
  When I fill in "user_email" with "graff@fs.com"
  And I fill in "user_fullname" with "Kirill Zonov"
  And I fill in "user_password" with "password"
  And I fill in "user_password_confirmation" with "password"
  And press "user_submit"
  Then user "graff@fs.com" is exist
