# frozen_string_literal: true
require 'csv'

module Strategy
  module Reports
    class MonthlyReport
      attr_reader :params

      def initialize(params)
        #TODO: Modify this on the call to just use params
        @params = params[0]
      end
      
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
        @monthly_expenses = ExpenseRepository.instance.expenses_by_month(year: params[:year], month: params[:month])

        @report = CSV.generate(headers: headers, write_headers: true) do |csv|
          @monthly_expenses.each do |expense|
            csv << [expense.payee, expense.amount, expense.expense_date, expense.active]
          end
        end
      end

      def headers
        %i[payee amount expense_date status]
      end
    end
  end
end
