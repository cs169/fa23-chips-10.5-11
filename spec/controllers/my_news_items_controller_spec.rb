# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyNewsItemsController, type: :controller do
  let(:valid_attributes) do
    { news: 'News', title: 'Title', description: 'Description', link: 'Link', representative_id: 1 }
  end

  let(:invalid_attributes) do
    { news: nil, title: nil, description: nil, link: nil, representative_id: nil }
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
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

      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { news_item: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { news: 'Updated News', title: 'Updated Title', description: 'Updated Description', link: 'Updated Link',
representative_id: 1 }
      end

      it 'updates the requested news_item' do
        news_item = NewsItem.create! valid_attributes
        put :update, params: { id: news_item.to_param, news_item: new_attributes }
        news_item.reload
        expect(news_item.news).to eq('Updated News')
      end

      it 'redirects to the news_item' do
        news_item = NewsItem.create! valid_attributes
        put :update, params: { id: news_item.to_param, news_item: valid_attributes }
        expect(response).to redirect_to(news_item)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        news_item = NewsItem.create! valid_attributes
        put :update, params: { id: news_item.to_param, news_item: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested news_item' do
      news_item = NewsItem.create! valid_attributes
      expect do
        delete :destroy, params: { id: news_item.to_param }
      end.to change(NewsItem, :count).by(-1)
    end

    it 'redirects to the news_items list' do
      news_item = NewsItem.create! valid_attributes
      delete :destroy, params: { id: news_item.to_param }
      expect(response).to redirect_to(news_items_url)
    end
  end
end
