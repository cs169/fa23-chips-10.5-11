require 'rails_helper'

RSpec.describe NewsItemsController, type: :controller do
  let(:representative) { Representative.create!(name: 'John Doe') }
  let(:valid_attributes) {
    { title: 'Title', description: 'Description', link: 'http://example.com', representative_id: representative.id, issue: 'Free Speech' }
  }

  let(:invalid_attributes) {
    { title: '', description: '', link: '', representative_id: '', issue: '' }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { representative_id: representative.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      news_item = NewsItem.create! valid_attributes
      get :show, params: {id: news_item.to_param, representative_id: representative.id}
      expect(response).to be_successful
    end
  end
end

