# frozen_string_literal: true
FactoryBot.define do
  factory :expense, class: Expense do
    payee { "MyString" }
    amount { 1.5 }
    expense_date { "2023-11-10" }
    active { true }
  end

  trait :coffee do
    payee { 'Coffee' }
    amount { 2.50 }
    expense_date { '2023-11-10' }
    active { true }
  end

  trait :groceries do
    payee { 'Groceries' }
    amount { 150.0 }
    expense_date { '2023-11-10' }
    active { true }
  end

  trait :hospital do
    payee { 'Doctor Appointment' }
    amount { 200.0 }
    expense_date { '2023-11-11' }
    active { true }
  end

  trait :inactive_expense do
    payee { 'inactive expense' }
    amount { 100.0 }
    expense_date { '2023-11-11' }
    active { false }
  end
end
