class TransactionItem < ApplicationRecord

  belongs_to :album
  belongs_to :user
  belongs_to :transactionOrder, dependent: :destroy
end
