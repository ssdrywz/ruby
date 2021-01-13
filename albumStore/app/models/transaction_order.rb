class TransactionOrder < ApplicationRecord
  has_many :transaction_items
  belongs_to :user
end
