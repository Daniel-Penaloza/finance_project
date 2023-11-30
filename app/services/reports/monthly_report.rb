# frozen_string_literal: true

module Reports
  class MonthlyReport
    attr_reader :file, :date

    def initialize(file, date)
      @file = file
      @date = date
    end

    def execute
      send_email
    end

    private

    def send_email
      ExpensesMailer.send_mail(file_name, date).deliver_now
    end

    def file_name
      file.split.last.to_s
    end
  end
end
