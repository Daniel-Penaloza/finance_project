# frozen_string_literal: true

module Schemas
  module V1
    module Expenses
      IndexSchema = Dry::Schema.Params do
        optional(:date).value(:string)
        optional(:year).value(:string)
        optional(:month).value(:string)
        optional(:date_two).value(:string)
      end
    end
  end
end
