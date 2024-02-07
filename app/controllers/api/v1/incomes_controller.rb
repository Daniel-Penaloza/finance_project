# frozen_string_literal: true

module Api
  module V1
    class IncomesController < ApplicationController
      def index
        schema = Schemas::V1::Incomes::IndexSchema
        incomes_params = validate_schema(params.permit!.to_h, schema)
        @pagy, incomes = pagy(Incomes::Index.new(**incomes_params).execute, items: 20)
        incomes_serialized = serialize_result(@pagy, IncomeSerializer.new(incomes).serializable_hash)

        render json: incomes_serialized, status: :ok
      end
    end
  end
end
