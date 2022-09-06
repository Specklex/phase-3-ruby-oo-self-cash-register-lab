require "pry"

class CashRegister
  attr_accessor :discount, :total, :quantity, :stuff
  #   @@items = []

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @stuff = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    # only adds the title once
    for i in 0...quantity
        @stuff << title
    end
    # @stuff << title * quantity, but makes [eggseggseggs, tomatotomato]
  end

  def apply_discount
    if @discount > 0
      @total -= @total * @discount / 100
      "After the discount, the total comes to $#{@total}."
    else "There is no discount to apply."     end
    # binding.pry
  end

  def items
    @stuff
  end

  def void_last_transaction
    #subtract the last added item's price
    if @stuff.size == 0
      0.0
    else
      @total -= @stuff[-1].price
    end
  end
end

# cart = CashRegister.new()
# cart.add_item('eggs', 1.00, 3)
# # binding.pry
