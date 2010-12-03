Feature: Create new post
  As a logged in user
  I want to create new post

Background:
    Given a user exist with an email "graff@fs.com"
    And I am logged in as "graff@fs.com"
    And a category exists with a name "category_1"

Scenario:
    Given I am on the home page 
    And we know number of posts
    When I follow "New Post"
    And I fill in "post_content" with "My comment"
    And I fill in "post_theme" with "Some theme"
    And I select "category_1" from "post_category_id"
    And I press "post_submit"
    Then check number of posts
