class Suica
  attr_reader :charge
  # 預かり金(デポジット)として500円がデフォルトでチャージされているものとする
  def initialize
      @current_charge = 500
  end

  # Suicaには100円以上の任意の金額をチャージできる
  protected
  def charge(amount)
      # 100円未満をチャージしようとした場合は例外を発生させる
      if amount < 100
          raise "100円未満はチャージできません。"
      else
          @current_charge += amount
      end
  end
end