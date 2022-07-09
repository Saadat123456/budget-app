require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    it 'returns http success' do
      get '/categories'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /categories/new' do
    it 'returns http success' do
      get '/categories/new'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /categories' do
    it 'returns http success' do
      post '/categories'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end
end
