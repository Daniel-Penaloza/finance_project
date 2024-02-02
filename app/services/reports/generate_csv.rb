require 'csv'

module Reports
  class GenerateCsv
    attr_reader :params, :date, :monthly_expenses

    def initialize(params:)
      @params = params
      @date = predefined_date
      @monthly_expenses = monthly_expenses
    end

    def execute
      fill_csv
    end
   
    private

    def fill_csv
      CSV.generate(headers: headers, write_headers: true) do |csv|
        monthly_expenses.each do |expense|
          csv << add_element_to_csv(expense)
          csv << ["Total #{total_expenses_by_month}"] if @monthly_expenses.last == expense
        end
      end
    end

    def present_params?
      params&.include?(:year) && params&.include?(:month)
    end
  
    def headers
      %i[payee amount expense_date status]
    end

    def predefined_date
      Time.use_zone('Mexico City') { Time.now.in_time_zone }
    end

    def monthly_expenses
      present_params? ? expenses_by_month : expenses_current_month
    end

    def expenses_by_month
      ExpenseRepository.instance.expenses_by_month(year: params[:year], month: params[:month])
    end

    def expenses_current_month
      ExpenseRepository.instance.expenses_by_month(year: date.year, month: date.month)
    end

    def total_expenses_by_month
      monthly_expenses.sum(&:amount)
    end

    def add_element_to_csv(expense)
      [expense.payee, expense.amount, expense.expense_date, expense.active]
    end
  end
end
