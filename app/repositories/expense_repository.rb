# frozen_string_literal: true

class ExpenseRepository < BaseRepository
  def active_expenses
    @db_client.where(active: true)
  end
end