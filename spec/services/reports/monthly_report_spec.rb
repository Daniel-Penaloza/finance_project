# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::MonthlyReport do
  let(:service) { described_class }
  let(:date) { '2023_01' }
  let!(:file) { Pathname.new('tmp/monthly_report_2023_08.csv') }

  before(:each) do
    allow(Pathname).to receive(:new).with('tmp/monthly_report_2023_08.csv')
  end
  
  context '#successful' do
    
    it 'with params' do
      result = service.new(file, date).execute
      expect(result).to be_a(Mail::Message)
      expect(result.to[0]).to eq('danielpenalozatj@gmail.com')
    end
  end
end
