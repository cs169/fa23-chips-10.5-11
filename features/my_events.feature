Feature: my events

  As someone interested in politics
  I want to be able to see and edit my events

Scenario: when not logged in, we get sent to the login page
  When I am on event 1
  Then I should see "Sign in"
