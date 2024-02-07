class CreateIncomesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.string :transmitter
      t.float :amount
      t.date :transmition_date
      t.boolean :active

      t.timestamps
    end
  end
end
