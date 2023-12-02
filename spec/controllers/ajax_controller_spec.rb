require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe 'GET #counties' do
    let(:state) { State.create(name: 'Test State', symbol: 'TS', fips_code: '00', is_territory: false) }

    before do
      get :counties, params: { state_symbol: state.symbol }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns correct counties' do
      expect(JSON.parse(response.body)).to eq(state.counties.as_json)
    end
  end
end
