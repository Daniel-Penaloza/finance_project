# frozen_string_literal: true

module Schemas
  module V1
    module Incomes
      IndexSchema = Dry::Schema.Params do
        optional(:date).value(:string)
        optional(:year).value(:string)
        optional(:month).value(:string)
      end
    end
  end
end
