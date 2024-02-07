# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Incomes', type: :request do
  let!(:salary) { create(:incomes, :salary) }
  let!(:other_incomes) { create(:incomes, :other_incomes) }
  let(:salaries) { create_list(:incomes, 34) }

  describe 'GET #index' do
    it 'success' do
      get '/api/v1/incomes'
      expect(response.status).to eq(200)
    end

    it 'success a list of incomes' do
      get '/api/v1/incomes'
      expect(response.status).to eq(200)

      result = JSON.parse(response.body)
      expect(result['data'].count).to eq(2)
    end

    context 'on batches of twenty' do
      it do
        salaries
        get '/api/v1/incomes'
      
        result = JSON.parse(response.body)
        expect(result['data'].count).to eq(20)
      end
    end
  end  
end
