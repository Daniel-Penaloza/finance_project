class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :payee
      t.float :amount
      t.date :expense_date

      t.timestamps
    end
  end
end
