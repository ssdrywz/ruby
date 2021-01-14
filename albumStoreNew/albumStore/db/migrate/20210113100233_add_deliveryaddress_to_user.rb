class AddDeliveryaddressToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deliveryaddress, :string
  end
end
