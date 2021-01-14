class CreateTransactionItems < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_items do |t|
      t.references :album, foreign_key: true
      t.references :user, foreign_key: true

      t.numeric :price
      t.integer :number

      t.timestamps
    end
  end
end
