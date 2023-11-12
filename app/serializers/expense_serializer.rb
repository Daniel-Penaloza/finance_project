# frozen_string_literal: true

class ExpenseSerializer
  include JSONAPI::Serializer
  
  attributes :id, :payee, :amount, :expense_date
end