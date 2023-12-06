require 'swagger_helper'

RSpec.describe 'api/v1/expenses', type: :request do
  path '/api/v1/expenses' do
    get('list expenses') do
      produces 'application/json'
      parameter name: :date,     getter: :date_filter,  in: :query, schema: { type: :string }, required: false
      parameter name: :year,     getter: :year_filter,  in: :query, schema: { type: :string }, required: false
      parameter name: :month,    getter: :month_filter, in: :query, schema: { type: :string }, required: false
      parameter name: :date_two, getter: :range_filter, in: :query, schema: { type: :string }, required: false

      response '200', 'list of expenses' do
        
        let!(:coffee) { create(:expense, :coffee) }
        let!(:groceries) { create(:expense, :groceries) }

        run_test!
      end
    end

    post('create expense') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/expenses/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show expense') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update expense') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update expense') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete expense') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  def set_parameter
  end
end
