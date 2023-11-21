Feature: Representative's profile page

  As someone curious about politics
  So that I can learn more about who represents me
  I want to see detailed information about a representative

Background: the database has some representatives

Scenario: View the profile of a representative
  When I am on the representatives page
  When I fill in "address" with "Sacramento"
  And I press "Search"
  Then I should see "Gavin Newsom"
  And I follow "Gavin Newsom"
  Then I should see "Gavin Newsom"
  And I should see "Governor"
  And I should see "1303 10th Street"
  And I should see "Sacramento"
  And I should see "CA"
  And I should see "95814"
  And I should see "Democratic"
