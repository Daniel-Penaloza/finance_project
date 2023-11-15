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
    expense_date { '2023-10-11' }
    active { true }
  end

  trait :school do
    payee { 'Schoool' }
    amount { 180.0 }
    expense_date { '2023-01-01' }
    active { true }
  end

  trait :water do
    payee { 'Water' }
    amount { 120.0 }
    expense_date { '2023-01-01' }
    active { true }
  end

  trait :party do
    payee { 'Party' }
    amount { 1800.0 }
    expense_date { '2023-01-01' }
    active { false }
  end

  trait :inactive_expense do
    payee { 'inactive expense' }
    amount { 100.0 }
    expense_date { '2023-11-11' }
    active { false }
  end
end
