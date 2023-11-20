Feature: I see the state map

  As someone curious about politics
  So that I can learn about who represents me
  I want to navigate to my state's map

Background: the database has some states

  Given the following states exist:
  | name        | symbol | fips_code | is_territory |
  | California  | CA     | 6         | false        |
  | Hawaii      | HI     | 15        | false        |

Scenario: I look for a non-existent state
  When I am on the state map of Florida
  Then I should see "not found"

Scenario: I search for California
  When I am on the state map of CA
  Then I should see "California"

Scenario: I search for Hawaii
  When I am on the state map of HI
  Then I should see "Hawaii"
