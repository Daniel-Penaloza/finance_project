# frozen_string_literal: true

module Schemas
  module V1
    module Expenses
      CreateSchema = Dry::Schema.Params do
        required(:payee).value(:string)
        required(:amount).value(:float)
        required(:expense_date).value(:string)
      end
    end
  end
end