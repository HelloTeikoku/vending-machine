require File.expand_path('../drink', __FILE__)

# 自動販売機クラス
class VendingMachine
  ACCEPTABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  attr_reader :stock, :total, :sale_amount
  def initialize
    @total = 0
    @sale_amount = 0
    #@stock = Array.new(5, Drink.new(name: "cola", price: 120))
    @stock = Array.new(5){Drink.new(name: "cola", price: 120)}
    @stock.concat Array.new(5){Drink.new(name: "redbull", price: 200)}
    @stock.concat Array.new(5){Drink.new(name: "water", price: 100)}
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
  def purchasable?(name)
    drink = @stock.find{|drink|
      drink.name == name
    }
    if (drink.price <= @total)
      drink
    end
  end

  # 購入
  def purchase(name)
    drink = purchasable?(name)
    if drink
      @sale_amount += drink.price
      @total -= drink.price
      @stock.delete(drink)
      @total
    end
  end

  # 購入可能リストを取得する
  def purchasable_drinks()
    purchasable_drinks = []
    @stock.map{|drink|
      if (drink.price <= @total && !purchasable_drinks.include?(drink.name))
        purchasable_drinks.push drink.name
      end
    }
    purchasable_drinks
  end
end

