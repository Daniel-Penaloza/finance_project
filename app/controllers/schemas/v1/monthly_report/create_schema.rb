# frozen_string_literal: true

module Schemas
  module V1
    module MonthlyReport
      CreateSchema = Dry::Schema.Params do
        optional(:year).value(:string)
        optional(:month).value(:string)
      end
    end
  end
end
