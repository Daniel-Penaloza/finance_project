# frozen_string_literal: true

100.times do |i|
  rand_bool = [true, false].sample

  Expense.create!(payee: Faker::Commerce.product_name, 
                  amount: Faker::Number.decimal(l_digits: 3),
                  expense_date: Faker::Date.between(from: '2020-01-01', to: '2024-01-01'),
                  active: rand_bool)
end
