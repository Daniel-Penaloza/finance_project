# frozen_string_literal: true
# GenerateMonthlyReportJob.perform_now(year: '2023', month: '08')

class GenerateMonthlyReportJob < ApplicationJob
  queue_as :default

  def perform(**args)
    Strategy::Reports::MonthlyReport.new(args).execute
  end
end
