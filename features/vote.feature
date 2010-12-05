Feature: Vote for a post
  As an anybody
  I want to vote for a post
  So I can do it just one time

Background:
  Given a post with id = 1 exists
  Given I haven't voted before

Scenario: 
  Given I am on the home page 
  And I know rate for the post 1
  When I voteup for post with id = 1
  Then I want know now rate for post 1 
