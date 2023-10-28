require "./suica.rb"
require "./juice.rb"

class Vending < Suica
  def initialize
    @suica
    @current_charge = 0
    @p_juice = Juice.new("ペプシ",150)
    @m_juice = Juice.new("モンスター",230)
    @i_juice = Juice.new("いろはす",120)
    # 初期状態で、ペプシ(150円)を5本格納している
    # 初期在庫にモンスター(230円)5本を追加する。
    # 初期在庫にいろはす(120円)5本を追加する。
    @stock = [[],[],[]]
    5.times do
      @stock[0] << @p_juice
      @stock[1] << @m_juice
      @stock[2] << @i_juice
    end
    @p_stock = @stock[0]
    @m_stock = @stock[1]
    @i_stock = @stock[2]
    # 自動販売機は現在の売上金額を取得できる(外部からは取得できない)
    @sell = 0
  end

  # Suicaにチャージ
  def charge(amount)
    @suica = Suica.new
    @current_charge = @suica.charge(amount)
  end
  
  # 自動販売機は購入可能なドリンクのリストを取得できる
  def list
    p "購入可能リスト"
    if @p_stock.length >= 1 
      p @p_juice.name
      p @p_stock.length
    end
    if @m_stock.length >= 1
      p @m_juice.name
      p @m_stock.length
    end
    if @i_stock.length >= 1
      p @i_juice.name
      p @i_stock.length
    end
  end

  # 自動販売機は在庫を取得できる
  def p_stock #ペプシ
    @p_stock
  end

  def m_stock #モンスター
    @m_stock
  end

  def i_stock # いろはす
    @i_stock
  end

  # 自動販売機に在庫を補充できるようにする
  def put_in(name)
    if name == "ペプシ"
       @p_stock << @p_juice
    elsif name == "モンスター"
       @m_stock << @m_juice
    elsif name == "いろはす"
       @i_stock << @i_juice
    end
  end

  def buy(name)
    # ジュース値段以上のチャージ残高がある条件下
    if name == "ペプシ" && @p_stock.length > 0
        # 自動販売機はジュースの在庫を減らす
        @p_stock.shift
        # Suicaのチャージ残高を減らす
        @suica.buy(@p_juice.price)
        # 売り上げ金額を増やす
        @sell += @p_juice.price
    elsif name == "モンスター" && @m_stock.length > 0
        @m_stock.shift
        @suica.buy(@m_juice.price)
        @sell += @m_juice.price
    elsif name == "いろはす" && @i_stock.length > 0 
        @i_stock.shift
        @suica.buy(@i_juice.price)
        @sell += @i_juice.price
    # チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる
    elsif @p_stock.length <= 0
      raise "ペプシは売り切れです"
    elsif @m_stock.length <= 0
      raise "モンスターは売り切れです"
    elsif @i_stock.length <= 0
      raise "いろはすは売り切れです"
    end
  end
end