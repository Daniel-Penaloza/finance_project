class Expense < ApplicationRecord
  validates_presence_of :payee, :amount, :expense_date
end
