class AddActiveToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :active, :boolean
  end
end
