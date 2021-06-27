class Transaction < ApplicationRecord
  belongs_to :stock

  validates :share_amount, :cost_per_share, :multiplier, :transaction_type, presence:true
  validates :share_amount, :cost_per_share, :multiplier, numericality:true
end
