class CreateTransactionOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_orders do |t|
      t.references :transaction_item, foreign_key: true
      t.references :user, foreign_key: true
      t.string :delivery_name
      t.string :delivery_address
      t.integer :delivery_phone
      t.integer :delivery_postcode
      t.string :delivery_state
      t.numeric :amount

      t.timestamps
    end
  end
end
