require File.expand_path('../drink', __FILE__)

# 自動販売機クラス
class VendingMachine
  AVALABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total_money = 0
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
  def total
    @total_money
  end

  # 払い戻し操作ができる
  def refund
    change = @total_money
    @total_money = 0
    change
  end
end

