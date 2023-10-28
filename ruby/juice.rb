class Juice
  def initialize(name,price)
      @name = name
      @price = price
  end

  def name
    @name
  end

  def price
    @price
  end
end

p_juice = Juice.new("ペプシ",150)
m_juice = Juice.new("モンスター",150)
i_juice = Juice.new("いろはす",120)

stock = []

5.times do 
stock << p_juice
stock << m_juice
stock << i_juice
end
