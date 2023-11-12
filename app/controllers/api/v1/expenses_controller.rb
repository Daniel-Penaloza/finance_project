# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApplicationController
      def index
        @expenses = Expense.all

        render json: ExpenseSerializer.new(@expenses).serializable_hash.to_json, status: :ok
      end

      def create
        @expense = Expense.new(expense_params)
        
        if @expense.save
          render json: ExpenseSerializer.new(@expense).serializable_hash.to_json, status: :created
        else
          render_error(errors: @expense.errors.full_messages)
        end
      end

      private

      def expense_params
        params.permit(:payee, :amount, :expense_date)
      end

      def render_error(errors, status= :unprocessable_entity)
        render json: errors, status: status
      end
    end
  end
end
