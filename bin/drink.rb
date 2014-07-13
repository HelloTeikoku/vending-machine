class Drink
  attr_accessor :name, :price
  def initialize(name: name, price: price)
    @name = name
    @price = price
  end
end