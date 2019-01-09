
class CashRegister
  attr_accessor :total, :items, :last_transaction

  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  def add_item(title,price,quantity=1)
    self.total += price * quantity

    quantity.times do
      @items << title
    end

    @last_transaction = quantity * price

  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      self.total = (@total * (1 - @discount.to_f / 100)).to_i #(1-@discount/100)*@total
      return "After the discount, the total comes to $#{self.total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_transaction
    self.total
  end

end
