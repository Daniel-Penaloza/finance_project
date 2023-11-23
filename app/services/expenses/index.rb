# frozen_string_literal: true

module Expenses
  class Index < BaseService
    def execute
      return expenses_by_date if date?
      return expenses_by_month if month?
      return expenses_by_year if year?

      active_expenses
    end

    private

    def expenses_by_date
      ExpenseRepository.instance.expenses_by_date(date: params[:date])
    end

    def expenses_by_year
      ExpenseRepository.instance.expenses_by_year(year: params[:year])
    end

    def expenses_by_month
      ExpenseRepository.instance.expenses_by_month(year: params[:year], month: params[:month])
    end

    def active_expenses
      ExpenseRepository.instance.active_expenses
    end

    def date?
      params[:date].present?
    end

    def month?
      year? && params[:month].present?
    end
    
    def year?
      params[:year].present?
    end
  end
end