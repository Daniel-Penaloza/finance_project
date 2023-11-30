# frozen_string_literal: true
# GenerateMonthlyReportJob.perform_now(year: '2023', month: '08')
# GenerateMonthlyReportJob.perform_now

class GenerateMonthlyReportJob < ApplicationJob
  queue_as :default

  def perform(**args)
    file, date = generate_report(args)
    send_mail(file, date)
  end

  def generate_report(args)
    Strategy::Reports::MonthlyReport.new(args).execute
  end
  
  def send_mail(file, date)
    Reports::MonthlyReport.new(file, date).execute
  end
end
