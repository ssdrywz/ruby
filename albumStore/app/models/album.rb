class Album < ApplicationRecord
  validates :name, :description, :price, presence: true
  validates :sales, numericality: { only_integer: true }

  belongs_to :region
  belongs_to :genre
  belongs_to :musician
  has_many :passive_likes, class_name:  "Favorite", foreign_key: "album_id", dependent:   :destroy
  has_many :users, through: :passive_likes, source: :user

  has_many :passive_carts, class_name: "Cart", foreign_key: "album_id", dependent: :destroy
  has_many :users, through: :passive_carts, source: :user

  has_many :transaction_items ,dependent: :delete_all
  has_many :transaction_orders, dependent: :delete_all
end
