class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user_id
      t.references :album_id

      t.timestamps null: false
    end
    #add_index :favorites, :user_id
    #add_index :favorites, :album_id
    #add_index :favorites, [:user_id, :album_id], unique: true
  end
end
