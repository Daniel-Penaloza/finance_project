# frozen_string_literal: true

module Expenses
  class Create < BaseService
    def execute
      create_expense
    end

    private

    def create_expense
      ExpenseRepository.instance.create_from_params!(**params)
    end
  end
end
