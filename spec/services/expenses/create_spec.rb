# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expenses::Create do
  let(:service) { described_class }
  
  context '#success' do
    let(:params) { { payee: 'payee', amount: 23.00, expense_date: '2023-01-01' } }

    it 'create an expense' do
      expect { execute_service(params) }.to change { Expense.count }.by(1)
    end
  end
  
  context '#fail' do
    let(:fail_params) { {} }

    it 'without params' do
      expect { execute_service(fail_params) }.to raise_error(ActiveRecord::RecordInvalid) 
    end
  end

  def execute_service(params)
    described_class.new(**params).execute
  end
end
