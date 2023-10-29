class Suica
  # 預かり金(デポジット)として500円がデフォルトでチャージされているものとする
  def initialize
      @current_charge = 500
  end
  protected
  # Suicaには100円以上の任意の金額をチャージできる
  def charge(amount)
      # 100円未満をチャージしようとした場合は例外を発生させる
      raise "100円未満はチャージできません。" if amount < 100
      p @current_charge += amount
    
  end
  # Suicaのチャージ残高を減らす
  def buy(price)
    raise "チャージ金額が不足しています" if @current_charge < price
    @current_charge -= price
  end
  # Suicaの現在のチャージ残高
  def current_charge
    @current_charge
  end
end