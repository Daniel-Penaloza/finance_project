# frozen_string_literal: true

class ExpenseRepository < BaseRepository
  def active_expenses
    @db_client.where('active =?', true)
  end

  def sum_by_date(date)
    expenses = @db_client.where('expense_date = ? AND active = ?', date, true)
    expenses.sum(&:amount)
  end

  def sum_by_year(date)
    year = Time.parse(date).strftime('%Y')
    expenses = @db_client.all.select {|expense| expense.expense_date.year.to_s == year && expense.active == true }
    expenses.sum(&:amount)
  end

  def sum_by_month(date)
    month = Time.parse(date).strftime('%m')
    expenses = @db_client.all.select {|expense| expense.expense_date.month.to_s == month && expense.active == true }
    expenses.sum(&:amount)
  end
end