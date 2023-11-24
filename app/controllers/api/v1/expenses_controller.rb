# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApplicationController
      before_action :set_expense, only: %i[update show destroy]

      def index
        schema = Schemas::V1::Expenses::IndexSchema
        expenses_params = validate_schema(params.permit!.to_h, schema)
        expenses = Expenses::Index.new(**expenses_params).execute

        render json: ExpenseSerializer.new(expenses).serializable_hash.to_json, status: :ok
      end

      def create
        schema = Schemas::V1::Expenses::CreateSchema
        expense_params = validate_schema(params.permit!.to_h, schema)
        expense = Expenses::Create.new(**expense_params).execute
        
        if expense.save
          render json: ExpenseSerializer.new(expense).serializable_hash.to_json, status: :created
        end
      end

      def update
        schema = Schemas::V1::Expenses::UpdateSchema
        expense_params = validate_schema(params.permit!.to_h, schema)
      
        if @expense.update!(expense_params)
          render json: ExpenseSerializer.new(@expense).serializable_hash.to_json, status: :ok
        end
      end

      def show
        if @expense
          render json: ExpenseSerializer.new(@expense).serializable_hash.to_json, status: :ok
        else
          render json: ExpenseSerializer.new([]).serializable_hash.to_json, status: :ok
        end
      end

      def destroy
        schema = Schemas::V1::Expenses::DestroySchema
        expense_params = validate_schema(params.permit!.to_h, schema)

        @expense.update_attribute(:active, false) if @expense.update!(expense_params)
        
        if @expense.save
          render json: { notice: 'expense deleted successfully' }, status: :ok 
        end
      end

      private

      def set_expense
        @expense = ExpenseRepository.instance.find_by(id: params[:id])
      end
    end
  end
end
