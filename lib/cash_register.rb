class CashRegister
  attr_accessor :discount, :total
  attr_accessor :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price = 0
  end

  def add_item(item, price, quantity=1)
    @total += price * quantity
    quantity.times{@items << item}
    @last_item_price = price * quantity
  end

  def apply_discount
    if discount != 0
      @total = @total - @total * discount/100
      "After the discount, the total comes to $#{@total}."
    elsif discount == 0
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item_price
  end

end
