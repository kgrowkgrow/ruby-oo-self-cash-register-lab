require 'pry'

class CashRegister

    attr_accessor :total, :discount, :all_items, :item_prices

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @all_items = []
        @item_prices = []
    end 

    def add_item(title, price, quantity = 1)
        multi_sum = quantity * price
        @total += multi_sum
        @all_items.fill(title, @all_items.size, quantity)
        @item_prices << {title: title, quantity: quantity, price: price}
    end

    def apply_discount
        if @discount
            @total = (1 - (@discount.to_f / 100.0)) * @total
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end 
    end 

    def items
        @all_items
    end 

    def void_last_transaction
        @total -= (@item_prices.last[:price] * @item_prices.last[:quantity])
        items.pop
    end 













end 