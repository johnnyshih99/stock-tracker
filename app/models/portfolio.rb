class Portfolio < ApplicationRecord
  has_many :stocks

  validates :name, presence: true

  def total_gain
    g = 0
    stocks.each do |st|
      g += st.current_value.abs if st.current_shares == 0 and st.current_value < 0
    end
    return g
  end

  def total_loss
    g = 0
    stocks.each do |st|
      g += st.current_value if st.current_shares == 0 and st.current_value > 0
    end
    return g
  end

  def stocks_by_cat
    h = {
      active: [],
      settled: [],
      err: false
    }

    stocks.each do |stock|
      if stock.current_shares > 0
        h[:active] << stock
      elsif stock.current_shares == 0
        h[:settled] << stock 
      else
        h[:err] = true
      end
    end
    h
  end

  def bag_hold
    h = []
    stocks.each do |st|
      if st.current_shares > 0
        h << {
          ticker: st.ticker,
          cur_shares: st.current_shares,
          cur_cost_avg: st.current_cost_average.round(4),
          cur_val: st.current_value.round(2),
        } 
      end
    end
    return h
  end

end
