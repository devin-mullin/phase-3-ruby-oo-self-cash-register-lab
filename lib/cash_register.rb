require 'pry'

class CashRegister
    attr_accessor :total, :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end 
    
    def add_item(item, price, quan=1)
        quan.times do
        @items << item
        @total += price
    end
        @last_transaction = price * quan
    end 

    def apply_discount 
        if (@discount == 0)
            "There is no discount to apply."
        else 
        @total = @total - (@total / 100 * @discount)
        "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
      @total -= @last_transaction
    end
      
end 

cash_register = CashRegister.new

cash_register.add_item("eggs", 0.99)
cash_register.add_item("tomato", 1.29)
cash_register.add_item("eggs", 0.99)