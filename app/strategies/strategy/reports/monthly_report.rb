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
        ::Reports::GenerateCsv.new(params: params).execute
      end


      def report_date
        return "#{date.year}_#{date.month}" if params.blank?
        return "#{params[:year]}_#{params[:month]}" if present_params?
      end

      def present_params?
        params&.include?(:year) && params&.include?(:month)
      end
      
      def predefined_date
        Time.use_zone('Mexico City') { Time.now.in_time_zone }
      end
    end
  end
end
