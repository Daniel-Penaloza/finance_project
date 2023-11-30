# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Strategy::Reports::MonthlyReport, type: :strategy do
  let(:strategy) { described_class }
  let!(:coffee) { create(:expense, :coffee) }
  let!(:groceries) { create(:expense, :groceries) }
  let!(:expense) { create(:expense) }
  let(:headers) { 'payee,amount,expense_date,status' }


  context '#succesfull' do
    let(:params) { { year: '2023', month: '11' } }
    
    it 'generates the report with params' do
      report = execute_strategy(params)
      expect(report[0]).to be_a(Pathname)
      expect(report[0].split.last.to_s).to eq("monthly_report_#{params[:year]}_#{params[:month]}.csv")
    end

    it 'generates the report without params' do
      date = Time.use_zone('Mexico City') { Time.now.in_time_zone }
      report = execute_strategy({})
      expect(report[0]).to be_a(Pathname)
      expect(report[0].split.last.to_s).to eq("monthly_report_#{date.year}_#{date.month}.csv")
    end
  end

  def execute_strategy(params)
    described_class.new(params).execute
  end
end
