class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :role
      t.string :email
      t.numeric :money

      t.timestamps
    end
  end
end
