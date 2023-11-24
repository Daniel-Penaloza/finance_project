# frozen_string_literal: true

module Schemas
  module V1
    module Expenses
      DestroySchema = Dry::Schema.Params do
        required(:id).value(:integer) 
      end
    end
  end
end
