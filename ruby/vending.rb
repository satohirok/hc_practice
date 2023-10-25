require "./suica.rb"
require "./juice.rb"

class Vending < Suica
  attr_reader :sell
  def initialize(amount)
    @suica = Suica.new
    @current_charge = @suica.charge(amount)
    @juice = Juice.new
    @juice_info = @juice.juice_info
    @p_name = @juice.p_name
    @m_name = @juice.m_name
    @i_name = @juice.i_name
    @p_price = @juice.p_price
    @m_price = @juice.m_price
    @i_price = @juice.i_price
    # 初期状態で、ペプシ(150円)を5本格納している
    @juice_info[0] << 5
    @p_stock = @juice_info[0][2]
    # 初期在庫にモンスター(230円)5本を追加する。
    @juice_info[1] << 5
    @m_stock = @juice_info[1][2]
    # 初期在庫にいろはす(120円)5本を追加する。
    @juice_info[2] << 5
    @i_stock = @juice_info[2][2]
    @sell = 0
  end

  # 自動販売機は購入可能なドリンクのリストを取得できる
  def list
    p @p_name
    p @m_name
    p @i_name
  end

  # 自動販売機は在庫を取得できる(購入処理後)
  def p_stock
    @p_stock
  end

  def m_stock
    @m_stock
  end

  def i_stock
    @i_stock
  end

  # 自動販売機に在庫を補充できるようにする
  def put_in(name)
    if name == "ペプシ"
       @p_stock += 1
    elsif name == "モンスター"
       @m_stock += 1
    elsif name == "いろはす"
       @i_stock += 1
    end
  end

  def buy(name)
    # ジュース値段以上のチャージ残高がある条件下
    if name == "ペプシ" && @p_stock > 0 && @current_charge >= @p_price
        # 自動販売機はジュースの在庫を減らす
        @p_stock -= 1
        # Suicaのチャージ残高を減らす
        @current_charge -= @p_price
      
        # 売り上げ金額を増やす
        @sell += @p_price 
    elsif name == "モンスター" && @m_stock > 0 && @current_charge >= @m_price
        @m_stock -= 1
        @current_charge -= @m_price
        @sell += @m_price 
    elsif name == "いろはす" && @i_stock > 0 && @current_charge >= @i_price
        @i_stock -= 1
        @current_charge -= @i_price
        @sell += @i_price 
    # チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる
    elsif @p_stock <= 0
      raise "ペプシは売り切れです"
    elsif @m_stock <= 0
      raise "モンスターは売り切れです"
    elsif @i_stock <= 0
      raise "いろはすは売り切れです"
    elsif @current_charge < @p_price || @current_charge < @m_price || @current_charge < @i_price
      raise "Suicaの残高が不足しております"
    end
  end

  # Suicaの現在のチャージ残高
  def current_charge
    @current_charge
  end 
   
  # 自動販売機は現在の売上金額を取得できる
  def sell
    @sell
  end
end


















