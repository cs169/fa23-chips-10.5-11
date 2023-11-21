# frozen_string_literal: true

# Tests for the representative model

require 'rails_helper'
require 'spec_helper'

class MockOfficial
  attr_accessor :name, :address, :party, :photo_url

  def initialize(official_name, official_address=nil, official_party=nil, official_photo_url=nil)
    @name = official_name
    @address = official_address
    @party = official_party
    @photo_url = official_photo_url
  end
end

class MockOffice
  attr_accessor :name, :division_id, :official_indices

  def initialize(office_name, division, indices)
    @name = office_name
    @division_id = division
    @official_indices = indices
  end
end

class MockInfo
  attr_accessor :officials, :offices

  def initialize(reps, offices_list)
    @officials = reps
    @offices = offices_list
  end
end

class MockAddress
  attr_accessor :line1, :city, :state, :zip

  def initialize(line1, city, state, zip)
    @line1 = line1
    @city = city
    @state = state
    @zip = zip
  end
end

describe Representative do
  before do
    @a_rep = MockOfficial.new('Tim Ryan', MockAddress.new('123 Main St', 'Anytown', 'CA', '12345'), 'Democrat', 'http://example.com/photo.jpg')
    @mock_office = MockOffice.new('U.S. Representative', 'US_REP', [0])
    @mock_info = MockInfo.new([@a_rep], [@mock_office])
  end

  it 'adds a representative' do
    result = described_class.civic_api_to_representative_params(@mock_info)
    expect(result[0].name).to eq 'Tim Ryan'
  end

  it 'does not add representative twice' do
    result1 = described_class.civic_api_to_representative_params(@mock_info)
    result2 = described_class.civic_api_to_representative_params(@mock_info)
    expect(result1).to eq(result2)
  end

  it 'checks representative party' do
    result = described_class.civic_api_to_representative_params(@mock_info)
    expect(result[0].party).to eq 'Democrat'
  end

  it 'checks representative address' do
    result = described_class.civic_api_to_representative_params(@mock_info)
    expect(result[0].address).to eq '123 Main St'
  end

  it 'checks representative state' do
    result = described_class.civic_api_to_representative_params(@mock_info)
    expect(result[0].state).to eq 'CA'
  end

  it 'checks representative photo_url' do
    result = described_class.civic_api_to_representative_params(@mock_info)
    expect(result[0].photo_url).to eq 'http://example.com/photo.jpg'
  end
end
