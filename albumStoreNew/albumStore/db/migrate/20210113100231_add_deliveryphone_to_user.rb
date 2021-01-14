class AddDeliveryphoneToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deliveryphone, :integer
  end
end
