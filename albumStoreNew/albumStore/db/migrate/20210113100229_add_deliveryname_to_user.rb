class AddDeliverynameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deliveryname, :string
  end
end
