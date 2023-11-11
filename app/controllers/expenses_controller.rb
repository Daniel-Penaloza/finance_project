# frozen_string_literal: true

module API
  module V1
    class ExpensesController < ApplicationController
      def index
        @expenses = Expense.all
      end
    end
  end
end
