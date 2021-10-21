require 'rails_helper'

RSpec.describe 'Farms', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/farms/index'
      expect(response).to have_http_status(:success)
    end
  end
end
