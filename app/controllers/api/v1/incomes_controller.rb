# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Incomes', type: :request do
  let!(:salary) { create(:incomes, :salary) }
  let!(:other_incomes) { create(:incomes, :other_incomes) }

  describe 'Get Incomes' do
    it 'success' do
      get 'api/v1/incomes'
      expect(response.status).to eq(200)
    end

    it 'success a list of incomes' do
      get 'api/v1/incomes'
      result = JSON.parse(response.body)
      expect(result['data'].count).to eq(2)
    end
  end
end
