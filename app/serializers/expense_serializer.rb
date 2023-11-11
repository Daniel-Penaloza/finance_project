# frozen_string_literal: true

class ExpenseSerializer
  include JSONAPI::Serializer
  
  attributes :payee, :amount, :expense_date
end