# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApplicationController
      before_action :set_expense, only: %i[update show]
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

      def update
        if @expense.update(expense_params)
          render json: ExpenseSerializer.new(@expense).serializable_hash.to_json, status: :ok
        else
          render_error(errors: @expense.errors.full_messages)
        end
      end

      def show
        if @expense
          render json: ExpenseSerializer.new(@expense).serializable_hash.to_json, status: :ok
        else
          render json: ExpenseSerializer.new([]).serializable_hash.to_json, status: :ok
        end
      end

      private

      def expense_params
        params.permit(:payee, :amount, :expense_date)
      end

      def render_error(errors, status= :unprocessable_entity)
        render json: errors, status: status
      end

      def set_expense
        @expense = Expense.find_by(id: params[:id])
      end
    end
  end
end
