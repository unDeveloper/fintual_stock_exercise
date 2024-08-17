# Fintual stock exercise

### Initial draft

![initial_draft_fintual](./initial_draft_fintual.jpg)

* According to the problem statement we can identify three entities.
  * Portfolio which will contain a collection of Stocks and a method to calculate the profit of the portfolio as a whole between two dates.
  * Stock that should handle individual stock elements and are related to a Portfolio. It also points to a method in which we can ask for the price of the stock in a given date.
    * Having the ability to ask for the price in a given date points out the existance of a price history for each Stock.

* Entities definition
  * Portfolio:
    * stocks (property): Collection of Stocks
    * profit (method): In charge to calculate the profits of the portfolio
  * Stock:
    * id (property): The stock identifier
    * date (property): The date the stock was bought
    * prices: Collection of the stock prices across time
    * price (method): Return a price of the stock on the given date.
  * Prices:
    * stock_id (property): The related stock
    * value (property): The value of the stock at that time
    * date (property): The date on which the price was recorded