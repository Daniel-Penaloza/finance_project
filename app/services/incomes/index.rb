# frozen_string_literal: true

module Incomes
  class Index < BaseService
    def execute
      get_incomes
    end

    private

    def get_incomes
      active_incomes
    end

    def active_incomes
      IncomeRepository.instance.active_incomes
    end
  end
end