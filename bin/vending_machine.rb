# -*- coding: utf-8 -*-


# 自動販売機クラス
class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  attr_reader :stock, :total, :sale_amount
  def initialize
    @total = 0
    @sale_amount = 0
    #@stock = Array.new(5, Drink.new(name: "cola", price: 120))
    @stock = Array.new(5){Drink.new(name: "cola", price: 120)}
  end

  # コインを投入する
  def input(money)
    if ACCEPTABLE_MONEY.include?(money)
      @total += money
      true
    end
  end

  # 払い戻し操作を行う
  def refund
    pay_back = @total
    @total = 0
    pay_back
  end

  # ジュース購入判定を行う
  def can_buy?(name)
    i = @stock.find_index{|drink|
      drink.name == name
    }
    cola = @stock[i]
    if (cola.price <= @total)
      cola
    else
      false
    end
  end

  # 購入
  def purchase(name)
    drink = can_buy?(name)
    if drink
      @sale_amount += drink.price
      @total -= drink.price
      @stock.delete(drink)
      true
    end
  end
end

class Drink
  attr_accessor :name, :price
  def initialize(name: name, price: price)
    @name = name
    @price = price
  end
end

