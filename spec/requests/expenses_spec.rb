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
      expect(result['data'].count).to eq(3)
    end
  end

  describe 'POST #create' do
    it 'succeess' do
      post '/api/v1/expenses', params:  { 'payee' => 'expense payee', 'amount' => 15.75, 'expense_date' => '2023-01-01' } 
      expect(response.status).to eq(201)

      result = JSON.parse(response.body)
      expect(result['data']['attributes']).to include_json(
        'id' => a_kind_of(Integer),
        'payee' => 'expense payee',
        'amount' => 15.75,
        'expense_date' => '2023-01-01'
      )
    end

    it 'fails' do
      post '/api/v1/expenses', params: {}
      expect(response.status).to eq(422)
      
      result = JSON.parse(response.body)
      expect(result['errors']).to include("Payee can't be blank", "Amount can't be blank", "Expense date can't be blank")
    end
  end
end
 