# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseSerializer do
  let!(:serializer) { described_class }
  let!(:coffee) { create(:expense, :coffee) }

  context 'serialize' do
    it '#successful' do
      result = serializer.new(coffee).serializable_hash
      expect(result.dig(:data, :attributes, :payee)).to eq('Coffee')
      expect(result.dig(:data, :attributes, :amount)).to eq(2.5)
      expect(result.dig(:data, :attributes, :expense_date)).to eq(Date.new(2023, 11, 10))
    end
  end
end

