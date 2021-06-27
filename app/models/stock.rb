class Stock < ApplicationRecord
  belongs_to :portfolio
  has_many :transactions, dependent: :destroy
  accepts_nested_attributes_for :transactions

  validates :ticker, presence: true

  def current_shares
    amount = 0
    self.transactions.each do |t|
      if t.transaction_type == "buy"
        amount += t.share_amount
      else
        amount -= t.share_amount
      end
    end
    return amount
  end

  def current_value
    r = 0
    self.transactions.each do |t|
      v = t.share_amount*t.cost_per_share*t.multiplier
      if t.transaction_type == "buy"
        r += v
      else
        r -= v
      end
    end
    return r
  end

  def current_cost_average
    r = 0
    r = current_value / current_shares if current_shares>0 and current_value>0
    return r
  end
end
