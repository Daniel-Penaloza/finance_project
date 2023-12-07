# frozen_string_literal: true

module Schemas
  module V1
    module Expenses
      UpdateSchema = Dry::Schema.Params do
        optional(:payee).filled(:string)
        optional(:amount).filled(:float)
        optional(:expense_date).filled(:string)
      end
    end    
  end
end
