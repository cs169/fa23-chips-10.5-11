Feature: events page

  As someone in politics
  I want to see a list of events in a given area
  So that I can get politically active

Background: the database has some states, counties and events

  Given the following states exist:
  | name        | symbol | fips_code | is_territory |
  | California  | CA     | 6         | false        |
  | Hawaii      | HI     | 15        | false        |

  And Given the following counties exist:
  | name           | state_id | fips_code | fips_class |
  | Marin county   | 1        | 6041      | idk        |
  | Alameda county | 1        | 6001      | idk        |
  | Hawaii county  | 2        | 15001     | idk        |

  And Given the following events exist:
  | name              | description                | county_id |
  | Pride parade      | Celebrating pride          | 2         |
  | BLM protest       | Racial justice             | 1         |
  | School fundraiser | Raising money for our kids | 3         |

Scenario: visiting the events page
  When I am on the events page
  Then I should see "Events"
  And I should see "Pride parade"
  And I should see "BLM protest"
  And I should see "School fundraiser"

Scenario: looking for events in California:
  When I am on the events page
  And I select "California" from "state"
  And I filter events by state
  Then I should see "Pride parade"
  And I should not see "School fundraiser"
