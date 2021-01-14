class AddDeliverypostcodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deliverypostcode, :integer
  end
end
