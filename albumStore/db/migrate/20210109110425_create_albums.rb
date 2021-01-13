class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :pic
      t.string :description
      t.numeric :price
      t.numeric :sales
      t.numeric :stock
      t.references :region, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :musician, foreign_key: true

      t.timestamps
    end
  end
end
