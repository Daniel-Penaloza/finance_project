# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expenses::Index do
  let(:service) { described_class }
  let!(:coffee) { create(:expense, :coffee) }
  let!(:groceries) { create(:expense, :groceries) }
  let!(:hospital) { create(:expense, :hospital) }
  let(:date_params) { { date: '2023-11-10' } }
  let(:month_params) { { year: '2023', month: '10' } }
  let(:year_params) { { year: '2023' } }

  describe 'active expenses' do
    context '#success' do      
      it 'by date' do
        result = execute_service(date_params)
        expect(result).to contain_exactly(coffee, groceries)
      end

      it 'by month' do
        result = execute_service(month_params)
        expect(result).to contain_exactly(hospital)
      end

      it 'by year' do
        result = execute_service(year_params)
        expect(result).to contain_exactly(coffee, groceries, hospital)
      end

      it 'active expenses' do
        result = execute_service({})
        expect(result).to contain_exactly(coffee, groceries, hospital)
      end
    end
  end

  def execute_service(params)
    described_class.new(**params).execute
  end
end
