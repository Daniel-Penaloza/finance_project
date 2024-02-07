# frozen_string_literal: true

class IncomeRepository < BaseRepository
  def active_incomes
    @db_client.where('active =?', true) 
  end
end
