class Juice
  def initialize
      # ジュースは名前と値段の情報をもつ
      @juice_info = [["ペプシ",150],["モンスター",230],["いろはす",120]]
      # 名前情報
      @p_name = @juice_info[0][0]
      @m_name = @juice_info[1][0]
      @i_name = @juice_info[2][0]
      # 値段情報
      @p_price = @juice_info[0][1]
      @m_price = @juice_info[1][1]
      @i_price = @juice_info[2][1]
  end

  def juice_info
    @juice_info
  end

  def p_name
    @p_name
  end

  def m_name
    @m_name
  end

  def i_name
    @i_name
  end

  def p_price
    @p_price
  end

  def m_price
    @m_price
  end

  def i_price
    @i_price
  end

end