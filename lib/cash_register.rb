require 'pry'

class CashRegister
    attr_accessor :total, :discount, :title, :price, :previous_total, :items, :item_arr

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end
    
    def add_item(title, price, quantity = 1)
        @previous_total = @total
        @total += price * quantity
        quantity.times { @items << title}
    end

    def apply_discount
        if (@discount != 0)
            @total -= @total * (@discount.to_f / 100.to_f)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @items.pop()
        @total = @previous_total
    end

end