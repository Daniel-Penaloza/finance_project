# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MonthlyReport', type: :request do
  describe 'Create and send montly report' do
    it '#successfull with date' do
      post '/api/v1/monthly_report', params: { year: '2023', month: '08' }
      expect(response.status).to eq(200)
    
      result = JSON.parse(response.body)
      expect(result['message']).to eq('Email send correctly')
    end

    it '#succesfull without date' do
      post '/api/v1/monthly_report', params: {}
      expect(response.status).to eq(200)
      
      result = JSON.parse(response.body)
      expect(result['message']).to eq('Email send correctly')
    end
  end
end
