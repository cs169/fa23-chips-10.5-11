Feature: login

  As someone interested in politics
  I want to be able to sign in

Scenario: able to log in with GitHub or Google
  When I am on the login page
  Then I should see "Sign in with Google"
  And I should see "Sign in with GitHub"
