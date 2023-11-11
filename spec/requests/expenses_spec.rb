# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'GET #index' do
    let!(:coffee) { create(:expense, :coffee) }
    let!(:groceries) { create(:expense, :groceries) }
    let!(:hospital) { create(:expense, :hospital) }

    it 'success' do
      get '/api/v1/expenses'
      expect(response.status).to eq(200)
    end

    it 'success a list of expenses' do
      get '/api/v1/expenses'
      expect(response.status).to eq(200)
      
      result = JSON.parse(response.body)
      # result['data']
      expect(result.count).to eq(3)
    end
  end
end
