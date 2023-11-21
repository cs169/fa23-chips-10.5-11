# frozen_string_literal: true

Given /the following representatives exist/ do |representatives_table|
  representatives_table.hashes.each do |rep|
    Representative.create!(name:      rep['name'],
                           ocdid:     rep['ocdid'],
                           title:     rep['title'],
                           address:   rep['address'],
                           city:      rep['city'],
                           state:     rep['state'],
                           zip:       rep['zip'],
                           party:     rep['party'],
                           photo_url: rep['photo_url'])
  end
end

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

Then /I navigate to the county map of (.*)/ do |county|
  page.find(:xpath, ".//td[text()='#{county}']/../td/a[text()='View']").click
end
