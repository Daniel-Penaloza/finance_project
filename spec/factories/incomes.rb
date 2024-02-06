# frozen_string_literal: true

FactoryBot.define do
  factory :incomes, class: Income do
    transmitter { 'MyString' }
    amount { 1.5 }
    transmition_date { '2023-11-10' }
  end

  trait :salary do
    transmitter { 'Bank' }
    amount { 1500 }
    transmition_date { '2023-11-10' }
  end

  trait :other_incomes do
    transmitter { 'other income' }
    amount { 250 }
    transmition_date { '2023-11-10' }
  end
end
