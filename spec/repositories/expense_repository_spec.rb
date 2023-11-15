# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseRepository, type: :repository do
  let!(:coffee) { create(:expense, :coffee) }
  let!(:groceries) { create(:expense, :groceries) }
  let!(:hospital) { create(:expense, :hospital) }
  let!(:inactive_expense) { create(:expense, :inactive_expense) }
  let(:repository) { described_class }

  describe '#active_expenses' do
    it do
      result = repository.instance.active_expenses
      expect(result.count).to eq(3)
    end
  end
end
