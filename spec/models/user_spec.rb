# frozen_string_literal: true

# tests for the county model

require 'rails_helper'
require 'spec_helper'

# FactoryBot.define do
#   factory :user do
#     add_attribute(:name) {"Ryan Kizior"}
#     add_attribute(:provider) {'google_oauth2'}
#     add_attribute(:uid) {1}
#   end
# end

describe User do
  before do
    # # create default user
    # user = User.new

    # add google user to table
    described_class.create!(first_name: 'Ryan',
                            last_name:  'Kizior',
                            provider:   'google_oauth2',
                            uid:        1)

    # add git user to table
    described_class.create!(first_name: 'Connor',
                            last_name:  'VonWinckelmann',
                            provider:   'github',
                            uid:        2)
  end

  it 'finds a valid google user' do
    result = described_class.find_google_user(1)
    expect(result.name).to eq 'Ryan Kizior'
  end

  it 'finds a valid git user' do
    result = described_class.find_github_user(2)
    expect(result.name).to eq 'Connor VonWinckelmann'
  end

  it 'does not find an invalid google user' do
    result = described_class.find_google_user(2)
    expect(result).to be_nil
  end

  it 'does not find an invalid git user' do
    result = described_class.find_github_user(1)
    expect(result).to be_nil
  end

  it 'does not add duplicate user' do
    expect do
      described_class.create!(first_name: 'Connor',
                              last_name:  'VonWinckelmann',
                              provider:   'github', uid: 2)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
