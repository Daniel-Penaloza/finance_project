# frozen_string_literal: true
require 'csv'

module Strategy
  module Reports
    class MonthlyReport < StrategyBase
      attr_accessor :date

      def initialize(date = nil)
        super
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
        ::Reports::GenerateCsv.new(params: params).execute
      end


      def report_date
        return "#{DateExtension.predefined_date.year}_#{DateExtension.predefined_date.month}" if params.blank?
        return "#{params[:year]}_#{params[:month]}" if present_params?
      end

      def present_params?
        params&.include?(:year) && params&.include?(:month)
      end
    end
  end
end
