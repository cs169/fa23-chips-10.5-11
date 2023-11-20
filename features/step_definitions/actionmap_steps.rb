
Given /the following states exist/ do |states_table|
  states_table.hashes.each do |state|
    State.create!(:name => state['name'],
      :symbol => state['symbol'],
      :fips_code => state['fips_code'],
      :is_territory => state['is_territory'],
      :lat_min => 0, :lat_max => 0, :long_min => 0, :long_max => 0,
      :created_at => Time.now(), :updated_at => Time.now())
  end
end  
