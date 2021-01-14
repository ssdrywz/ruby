class Cart < ApplicationRecord
  validates :number, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :album
end
