# frozen_string_literal: true
# # spec/controllers/my_news_items_controller_spec.rb
# require 'rails_helper'
# # spec/controllers/my_news_items_controller_spec.rb

# RSpec.describe MyNewsItemsController, type: :controller do
#     let(:valid_attributes) {
#         {
#             title: 'Test Title',
#             link: 'http://test.com',
#             representative_id: 1,
#             news: 'Test News',
#             issue: 'Test Issue'
#         }
#     }

#     let(:invalid_attributes) {
#       { title: nil, link: nil, representative_id: nil }
#     }

#     let(:valid_session) { {} }

#     # Add this before each test
#     before do
#       user = FactoryBot.create(:user)
#       session[:user_id] = user.id
#       Representative.create!(
#         id: 1,
#         name: 'Test Representative',
#         ocdid: 'ocdid',
#         title: 'title',
#         address: 'address',
#         city: 'city',
#         state: 'state',
#         zip: 'zip',
#         party: 'party',
#         photo_url: 'photo_url'
#       )
#     end

#     describe "POST #create" do
#       context "with valid params" do
#         it "creates a new NewsItem" do
#           expect {
#             post :create, params: { representative_id: 1, news_item: valid_attributes }
#           }.to change(NewsItem, :count).by(1)
#         end

#         it "redirects to the created news_item" do
#           post :create, params: { representative_id: 1, news_item: valid_attributes }
#           expect(response).to redirect_to(NewsItem.last)
#         end
#       end

#       context "with invalid params" do
#         it "does not create a new NewsItem" do
#           expect {
#             post :create, params: { representative_id: 1, news_item: invalid_attributes }
#           }.not_to change(NewsItem, :count)
#         end

#         it "re-renders the 'new' template" do
#           post :create, params: { representative_id: 1, news_item: invalid_attributes }
#           expect(response).to render_template("new")
#         end
#       end
#     end
#   end
