# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe ApplicationJob do
  it 'tests job lol' do
    result = described_class.to_s
    expect(result).to eq 'ApplicationJob'
  end
end
