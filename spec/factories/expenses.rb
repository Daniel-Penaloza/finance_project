# frozen_string_literal: true
FactoryBot.define do
  factory :expense, class: Expense do
    payee { "MyString" }
    amount { 1.5 }
    expense_date { "2023-11-10" }
  end

  trait :coffee do
    payee { 'Coffee' }
    amount { 2.50 }
    expense_date { '2023-11-10' }
  end

  trait :groceries do
    payee { 'Groceries' }
    amount { 150.0 }
    expense_date { '2023-11-10' }
  end

  trait :hospital do
    payee { 'Doctor Appointment' }
    amount { 200.0 }
    expense_date { '2023-11-11' } 
  end
end
