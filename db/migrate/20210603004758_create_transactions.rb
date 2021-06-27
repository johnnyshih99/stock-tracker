class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :share_amount
      t.decimal :cost_per_share
      t.decimal :multiplier
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
