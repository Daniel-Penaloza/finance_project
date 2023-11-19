# frozen_string_literal: true

module Schemas
  module V1
    module Expenses
      IndexSchema = Dry::Schema.Params do
        optional(:date).value(:string)
      end
    end
  end
end
