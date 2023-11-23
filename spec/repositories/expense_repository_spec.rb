# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseRepository, type: :repository do
  let!(:coffee) { create(:expense, :coffee) }
  let!(:groceries) { create(:expense, :groceries) }
  let!(:hospital) { create(:expense, :hospital) }
  let!(:inactive_expense) { create(:expense, :inactive_expense) }
  let!(:school) { create(:expense, :school) }
  let!(:water) { create(:expense, :water) }
  let!(:party) { create(:expense, :party) }
  let(:repository) { described_class }

  describe '#active_expenses' do
    it do
      result = repository.instance.active_expenses
      expect(result.count).to eq(6)
    end
  end

  describe '#sum_by_date' do
    it do
      result = repository.instance.sum_by_date('2023-11-10')
      expect(result).to eq 152.50
    end
  end

  describe '#sum_by_year' do
    it do
      result = repository.instance.sum_by_year('2023-11-10')
      expect(result).to eq 352.50
    end
  end
  
  describe '#sum_by_month' do
    it do
      result = repository.instance.sum_by_month('2023-10-10')
      expect(result).to eq(200)
    end
  end
end
