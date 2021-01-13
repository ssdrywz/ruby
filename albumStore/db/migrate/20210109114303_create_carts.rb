class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :album, foreign_key: true
      t.references :user, foreign_key: true
      t.numeric :price
      t.numeric :number

      t.timestamps
    end
  end
end
