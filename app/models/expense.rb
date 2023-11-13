class Expense < ApplicationRecord
  validates_presence_of :payee, :amount, :expense_date

  scope :all_active, -> { where('active = ?', true) }
end
