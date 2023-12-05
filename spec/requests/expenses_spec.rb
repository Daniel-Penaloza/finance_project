# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  let!(:coffee) { create(:expense, :coffee) }
  let!(:groceries) { create(:expense, :groceries) }
  let!(:hospital) { create(:expense, :hospital) }
  let!(:school) { create(:expense, :school) }
  let!(:water) { create(:expense, :water) }
  let!(:party) { create(:expense, :party) }
  let!(:inactive_expense) { create(:expense, :inactive_expense) }

  describe 'GET #index' do
    it 'success' do
      get '/api/v1/expenses'
      expect(response.status).to eq(200)
    end

    it 'success a list of expenses' do
      get '/api/v1/expenses'
      expect(response.status).to eq(200)
      
      result = JSON.parse(response.body)
      expect(result['data'].count).to eq(6)
    end

    it 'success expenses on given date' do
      get '/api/v1/expenses?date=2023-11-10'
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['data'].count).to eq(2)
    end

    it 'success expenses on given year' do
      get '/api/v1/expenses?year=2023'
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['data'].count).to eq(3)
    end

    it 'success expenses on given year and month' do
      get '/api/v1/expenses?year=2021&month=01'
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['data'].count).to eq(2)
    end

    it 'success expenses on given range' do
      get '/api/v1/expenses?date=2023-01-01&date_two=2023-12-30'
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
      expect { post '/api/v1/expenses', params: {} }.to raise_error(
        RuntimeError, 'There was an error in the parameters'
      )
    end
  end

  describe 'PUT #update' do
    it 'success' do
      patch "/api/v1/expenses/#{coffee.id}", params: { 'payee' => 'Starbucks Coffee' }
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['data']['attributes']['payee']).to eq('Starbucks Coffee')
    end

    it 'fails' do
      expect { patch "/api/v1/expenses/#{coffee.id}", params: { 'payee' => '' } }.to raise_error(
        RuntimeError, 'There was an error in the parameters'
      )
    end
  end

  describe 'GET #show' do
    it 'success' do
      get "/api/v1/expenses/#{coffee.id}"
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result.dig('data', 'attributes')).to include_json(
        'id' => a_kind_of(Integer),
        'payee' => 'Coffee',
        'amount' => 2.5,
        'expense_date' => '2023-11-10'
      )
    end

    it 'fails' do
      get '/api/v1/expenses/1234'
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['data']).to eq([])
    end
  end

  describe 'Soft Delete #delete' do
    it 'successful' do
      delete "/api/v1/expenses/#{coffee.id}"
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['notice']).to eq('expense deleted successfully')

      expect(Expense.find_by(id: coffee.id).active).to be_falsey
    end

    it 'fails' do
      expect { delete "/api/v1/expenses/asdf" }.to raise_error(
        RuntimeError, 'There was an error in the parameters'
      )
    end
  end
end
 