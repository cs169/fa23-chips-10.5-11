# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsItemsController, type: :controller do
  let(:representative) { Representative.create!(name: 'John Doe') }
  let(:valid_attributes) do
    { title: 'Title', description: 'Description', link: 'http://example.com', representative_id: representative.id,
issue: 'Free Speech' }
  end

  let(:invalid_attributes) do
    { title: '', description: '', link: '', representative_id: '', issue: '' }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { representative_id: representative.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      news_item = NewsItem.create! valid_attributes
      get :show, params: { id: news_item.to_param, representative_id: representative.id }
      expect(response).to be_successful
    end
  end
end
