# frozen_string_literal: true

require 'date'

Given /the following states exist/ do |states_table|
  states_table.hashes.each do |state|
    State.create!(name:         state['name'],
                  symbol:       state['symbol'],
                  fips_code:    state['fips_code'],
                  is_territory: state['is_territory'],
                  lat_min: 0, lat_max: 0, long_min: 0, long_max: 0,
                  created_at: Time.current,
                  updated_at: Time.current)
  end
end

Given /the following counties exist/ do |counties_table|
  counties_table.hashes.each do |country|
    County.create!(name:       country['name'],
                   state_id:   country['state_id'],
                   fips_code:  country['fips_code'],
                   fips_class: country['fips_class'],
                   created_at: Time.current,
                   updated_at: Time.current)
  end
end

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create!(name:        event['name'],
                  description: event['description'],
                  county_id:   event['county_id'],
                  start_time:  DateTime.now,
                  end_time:    DateTime.now + Rational(1, 24),
                  created_at:  Time.current,
                  updated_at:  Time.current)
  end
end

When /I filter events by state/ do
  page.find(:xpath, ".//input[@value='Filter by State']").click
end

When /I navigate to the county map of (.*)/ do |county|
  page.find(:xpath, ".//td[text()='#{county}']/../td/a[text()='View']").click
end
