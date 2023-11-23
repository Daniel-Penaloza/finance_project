# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Strategy::Reports::MonthlyReport, type: :strategy do
  let(:strategy) { described_class }
  let!(:coffee) { create(:expense, :coffee) }
  let!(:groceries) { create(:expense, :groceries) }
  let!(:expense) { create(:expense) }
  let(:headers) { 'payee,amount,expense_date,status' }


  context '#succesfull' do
    let(:params) { [{ year: '2023', month: '11' }] }
    
    it 'generates the report' do
      csv_content = execute_strategy(params)
      expect(csv_content).to include(headers)
      
      [coffee, groceries, expense].each do |expense|
        expect(csv_content).to include(expense.attributes['payee'])
      end
    end
  end

  def execute_strategy(params)
    described_class.new(params).execute
  end
end
