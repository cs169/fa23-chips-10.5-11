Feature: I see the state map

  As someone curious about politics
  So that I can learn about who represents me
  I want to navigate to my state's map

Background: the database has some states

  Given the following states exist:
  | name        | symbol | fips_code | is_territory |
  | California  | CA     | 6         | false        |
  | Hawaii      | HI     | 15        | false        |

  And Given the following counties exist:
  | name           | state_id | fips_code | fips_class |
  | Marin county   | 1        | 6041      | idk        |
  | Alameda county | 1        | 6001      | idk        |
  | Hawaii county  | 2        | 15001     | idk        |

Scenario: I look for a non-existent state
  When I am on the state map of Florida
  Then I should see "not found"

Scenario: I search for California
  When I am on the state map of CA
  Then I should see "California"
  Then I should see "Marin county"
  Then I should see "Alameda county"
  Then I should not see "Hawaii"

Scenario: I search for Hawaii
  When I am on the state map of HI
  Then I should see "Hawaii"
  Then I should see "Hawaii county"
  Then I should not see "Marin county"
  Then I should not see "not found"
