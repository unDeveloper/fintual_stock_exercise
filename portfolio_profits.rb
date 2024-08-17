require 'date'

class Price
  attr_accessor :date
  attr_accessor :stock_id
  attr_accessor :value

  def initialize(stock_id, value, date)
    @date = date
    @stock_id = stock_id
    @value = value
  end
end

class Stock
  attr_accessor :date
  attr_accessor :id
  attr_accessor :prices

  def initialize(id, prices, date)
    @id = id
    @prices = prices
    @date = date
  end

  def price(date_string)
    date_obj = DateTime.parse(date_string)
    return self.prices.each.find{|price| price.date == date_obj}
  end
end

class Portfolio
  attr_accessor :stocks

  def profit(start_date_string, final_date_string)
    start_date = DateTime.parse(start_date_string)
    final_date = DateTime.parse(final_date_string)
    stocks_return = []
    full_invested_amount = 0

    # extracting stocks from list during given time
    stocks_on_period = stocks.select { |stock| stock.date >= start_date && stock.date <= final_date }

    # return for each stock
    stocks_on_period.each do |stock|
      initial_value = stock.prices.first.value
      current_value = stock.prices.last.value
      full_invested_amount += initial_value
      stock_return = (current_value - initial_value) / initial_value
      stocks_return.push(stock_id: stock.id, stock_return: stock_return, invested_amount: initial_value, last_value: current_value)
    end

    # portfolio profit
    portfolio_return = 0
    stocks_return.each do |returns|
      stock_weight = returns[:invested_amount] / full_invested_amount
      portfolio_return += (stock_weight * returns[:stock_return]).to_f
    end

    annualized_return = ((1 + portfolio_return)** (12)) - 1
    return {current_return: portfolio_return, annualized_return: annualized_return}
  end
end
