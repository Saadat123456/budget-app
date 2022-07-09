require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories/index/budgetting_transactions' do
    it 'returns http success' do
      get '/categories/index/budgetting_transactions'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /categories/index/budgetting_transactions/new' do
    it 'returns http success' do
      get '/categories/index/budgetting_transactions/new'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST /categories/index/budgetting_transactions' do
    it 'returns http success' do
      post '/categories/index/budgetting_transactions'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /categories/index/budgetting_transactions/id' do
    it 'returns http success' do
      get '/categories/index/budgetting_transactions/id'
      # Expected to be found but inaccesible due to authorization
      expect(response).to have_http_status(:found)
    end
  end
end
