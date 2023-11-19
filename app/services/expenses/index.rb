# frozen_string_literal: true

module Expenses
  class Index < BaseService
    def execute
      active_expenses
    end

    private

    def active_expenses
      ExpenseRepository.instance.active_expenses
    end
  end
end