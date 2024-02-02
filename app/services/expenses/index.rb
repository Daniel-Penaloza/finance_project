# frozen_string_literal: true

module Expenses
  class Index < BaseService
    def execute
      get_expenses
    end

    private

    def get_expenses
      case params.keys
      when [:date, :date_two] then expenses_by_range
      when [:date] then expenses_by_date
      when [:year, :month] then expenses_by_month
      when [:year] then expenses_by_year
      else
        active_expenses
      end
    end

    def expenses_by_date
      ExpenseRepository.instance.expenses_by_date(date: params[:date])
    end

    def expenses_by_year
      ExpenseRepository.instance.expenses_by_year(year: params[:year])
    end

    def expenses_by_month
      ExpenseRepository.instance.expenses_by_month(year: params[:year], month: params[:month])
    end

    def expenses_by_range
      ExpenseRepository.instance.expenses_by_range(date: params[:date], date_two: params[:date_two])
    end

    def active_expenses
      ExpenseRepository.instance.active_expenses
    end
  end
end