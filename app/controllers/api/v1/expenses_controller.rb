# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApplicationController
      def index
        @expenses = Expense.all

        render json: ExpenseSerializer.new(@expenses).serializable_hash.to_json
      end
    end
  end
end
