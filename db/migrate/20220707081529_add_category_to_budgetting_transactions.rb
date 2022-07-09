class AddCategoryToBudgettingTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :budgetting_transactions, :group, null: false, foreign_key: true
  end
end
