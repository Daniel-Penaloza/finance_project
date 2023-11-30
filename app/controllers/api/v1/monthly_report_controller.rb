# frozen_string_literal: true

module Api
  module V1
    class MonthlyReportController < ApplicationController
      def create
        schema = Schemas::V1::MonthlyReport::CreateSchema
        report_params = validate_schema(params.permit!.to_h, schema)
        GenerateMonthlyReportJob.perform_now(**report_params)

        render json: { message: 'Email send correctly' }, status: :ok
      end
    end
  end
end
