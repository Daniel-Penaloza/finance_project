# frozen_string_literal: true
require 'csv'

module Strategy
  module Reports
    class MonthlyReport < StrategyBase
      attr_accessor :date

      def initialize(date = nil)
        super
        @date = predefined_date
      end
  
      def execute
        setup_file_options
        open_file
        [@file_path, report_date]
      end

      private

      def setup_file_options
        @file_path = Rails.root.join('tmp', "monthly_report_#{report_date}.csv")
      end

      def open_file
        File.open(@file_path, 'w') do |file|
          file.puts generate_csv
        end
      end

      def generate_csv
        @monthly_expenses = if present_params?  
                              expenses_by_month 
                            else
                              expenses_current_month
                            end

        @report = CSV.generate(headers: headers, write_headers: true) do |csv|
          @monthly_expenses.each do |expense|
            csv << [expense.payee, expense.amount, expense.expense_date, expense.active]
            csv << ["Total #{@monthly_expenses.sum(&:amount)}"] if @monthly_expenses.last == expense
          end
        end
      end

      def headers
        %i[payee amount expense_date status]
      end

      def present_params?
        params&.include?(:year) && params&.include?(:month)
      end

      def expenses_by_month
        ExpenseRepository.instance.expenses_by_month(year: params[:year], month: params[:month])
      end

      def expenses_current_month
        ExpenseRepository.instance.expenses_by_month(year: date.year, month: date.month)
      end
  
      def report_date
        return "#{date.year}_#{date.month}" if params.blank?
        return "#{params[:year]}_#{params[:month]}" if present_params?
      end

      def predefined_date
        Time.use_zone('Mexico City') { Time.now.in_time_zone }
      end
    end
  end
end
