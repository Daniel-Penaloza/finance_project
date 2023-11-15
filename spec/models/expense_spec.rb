require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:payee) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:expense_date) }
  end
end
