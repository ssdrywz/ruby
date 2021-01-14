class User < ApplicationRecord
  validates :name, length: {minimum: 2}, uniqueness: true
  validates :password, length: { in: 6..20}
  validates :email, :money, :role, presence: true

  has_many :active_carts, class_name: "Cart",
           foreign_key: "user_id",
           dependent: :destroy
  has_many :albums, through: :active_carts, source: :album

  has_many :active_likes, class_name:  "Favorite",
           foreign_key: "user_id",
           dependent:   :destroy
  has_many :albums, through: :active_likes, source: :album

  has_many :transaction_items, dependent: :delete_all
  has_many :transaction_orders, dependent: :destroy

end
