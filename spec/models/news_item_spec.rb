# frozen_string_literal: true

# tests for the news_item model

require 'rails_helper'
require 'spec_helper'

describe NewsItem do
  before do
    Representative.create!(name:  'Ryan',
                           ocdid: 1,
                           title: 'rep 1 Ryan')
    Representative.create!(name:  'Connor',
                           ocdid: 2,
                           title: 'rep 2 Connor')

    described_class.create!(title:             'rep 1',
                            representative_id: 1,
                            link:              'randomlink1.com')

    described_class.create!(title:             'rep 2',
                            representative_id: 2,
                            link:              'randomlink2.com')
  end

  it 'finds a valid news_item' do
    result = described_class.find_for(1)
    expect(result.title).to eq('rep 1')
  end

  it 'does not find an invalid news_item' do
    result = described_class.find_for(3)
    expect(result).to be_nil
  end
end
