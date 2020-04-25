require File.expand_path('../drink', __FILE__)

# 自動販売機クラス
class VendingMachine
  # あとで勉強
  # attr_reader :total_money
  # attr_writer :total_money
  # attr_accessor :total_money

  AVALABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  
  def initialize
    @total_money = 0
    @sale_amount = 0
    @drinks = [Drink.new('cola', 120)] * 5
  end

  # お金を投入できる
  def input(money)
    # @total_money = @total_money + coin
    if AVALABLE_MONEY.include?(money)
      # trueの場合
      @total_money += money
    else
      # falseの場合
    end
  end

  # 投入金額の合計を取得できる
  def total_money
    @total_money
  end

  # 払い戻し操作ができる
  def refund
    change = @total_money
    @total_money = 0
    change
  end

  # ドリンクの配列を返す
  def stock
    @drinks
  end

  def purchasable?(drink_name)
    target_drink = find_drink(drink_name)
    return nil if target_drink.nil?

    price = target_drink.price
    # 取得したドリンクの値段と、投入金額を比べる
    if @total_money >= price
      return true
    else
      return nil
    end
  end

  def purchase(drink_name)
    drink_price = find_drink(drink_name).price
    @sale_amount += drink_price
    @total_money -= drink_price

    return @total_money
  end

  def sale_amount
    @sale_amount
  end

  private

  # 渡された名前のドリンクを取得する
  def find_drink(name)
    @drinks.find { |d| d.name == name}
  end
end

