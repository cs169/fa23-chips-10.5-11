# frozen_string_literal: true

# spec/controllers/my_news_items_controller_spec.rb
require 'rails_helper'

RSpec.describe MyNewsItemsController, type: :controller do
  let(:valid_attributes) do
    { title: 'Test Title', link: 'http://test.com', representative_id: 1 }
  end

  let(:invalid_attributes) do
    { title: nil, link: nil, representative_id: nil }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new NewsItem' do
        expect do
          post :create, params: { news_item: valid_attributes }
        end.to change(NewsItem, :count).by(1)
      end

      it 'redirects to the created news_item' do
        post :create, params: { news_item: valid_attributes }

        expect(response).to redirect_to(NewsItem.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new NewsItem' do
        expect do
          post :create, params: { news_item: invalid_attributes }
        end.not_to change(NewsItem, :count)
      end

      it "re-renders the 'new' template" do
        post :create, params: { news_item: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end
end
