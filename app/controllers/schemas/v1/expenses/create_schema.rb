# frozen_string_literal: true

module Schemas
  module V1
    module Expenses
      CreateSchema = Dry::Schema.Params do
        required(:payee).filled(:string)
        required(:amount).filled(:float)
        required(:expense_date).filled(:string)
      end
    end
  end
end