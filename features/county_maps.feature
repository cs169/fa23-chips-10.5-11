Feature: I see the county map and associated representatives

  As someone curious about politics
  So that I can learn about who represents me
  I want to get a list of my county's representatives

Background: the database has some states

  Given the following states exist:
  | name        | symbol | fips_code | is_territory |
  | California  | CA     | 6         | false        |

  And Given the following counties exist:
  | name           | state_id | fips_code | fips_class |
  | Marin county   | 1        | 6041      | idk        |
  | Alameda county | 1        | 6001      | idk        |

Scenario: see the representatives of Alameda county
  When I am on the state map of CA
  Then I should see "Counties in California"
  And Then I navigate to the county map of Alameda county
  Then I should see "Newsom"
  Then I should see "Pamela Price"
  Then I should see "Phong La"

Scenario: see the representatives of Marin county:
  When I am on the state map of CA
  Then I navigate to the county map of Marin county
  Then I should see "Shelly Scott"
