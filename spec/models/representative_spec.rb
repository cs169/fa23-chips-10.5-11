# frozen_string_literal: true

# Tests for the representative model

require 'rails_helper'
require 'spec_helper'

class MockOfficial
  attr_accessor :name

  def initialize(official_name)
    @name = official_name
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

describe Representative do
  before do
    @a_rep = MockOfficial.new('Tim Ryan')
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
end
