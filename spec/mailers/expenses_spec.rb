require "rails_helper"

RSpec.describe ExpensesMailer, type: :mailer do
  let(:filename) { "monthly_report_2023_08.csv" }
  let(:date) { '2023_08' }
  let(:mail) { described_class.send_mail(filename, date).deliver_now }

  context 'successfull' do
    it 'renders all the setup' do
      expect(mail.subject).to eq('Monthly Expenses 2023_08')
      expect(mail.from).to eq(['danielpenalozatj@gmail.com'])
    end

    it 'send an email' do
      expect { described_class.send_mail(filename, date).deliver_now }.to change { ActionMailer::Base.deliveries.count}.by(1)
    end
  end
end
