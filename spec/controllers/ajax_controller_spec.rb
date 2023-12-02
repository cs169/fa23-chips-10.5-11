require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe 'GET #counties' do
    let(:state) { create(:state) }

    before do
      get :counties, params: { state_symbol: state.symbol }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns correct counties' do
      expect(JSON.parse(response.body)).to eq(state.counties)
    end
  end
end
