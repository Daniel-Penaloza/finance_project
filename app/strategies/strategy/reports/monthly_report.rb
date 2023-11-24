# frozen_string_literal: true
require 'csv'

module Strategy
  module Reports
    class MonthlyReport < StrategyBase
      def execute
        setup_file_options
        open_file
        @report
      end

      private

      def setup_file_options
        @file_path = Rails.root.join('tmp', 'monthly_report.csv')
      end

      def open_file
        File.open(@file_path, 'w') do |file|
          file.puts generate_csv
        end
      end

      def generate_csv
        if present_params?
          @monthly_expenses = ExpenseRepository.instance.expenses_by_month(year: params[:year], month: params[:month])

          @report = CSV.generate(headers: headers, write_headers: true) do |csv|
            @monthly_expenses.each do |expense|
              csv << [expense.payee, expense.amount, expense.expense_date, expense.active]
            end
          end
        else
          raise "There was an error in the parameters"
        end
      end

      def headers
        %i[payee amount expense_date status]
      end

      def present_params?
        params&.include?(:year) && params&.include?(:month)
      end
    end
  end
end
