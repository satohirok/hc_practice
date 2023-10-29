require "./suica.rb"
require "./juice.rb"

class Vending < Suica
  def initialize
    @suica
    @current_charge = 0
    @p_juice = Juice.new("ペプシ",150)
    @m_juice = Juice.new("モンスター",230)
    @i_juice = Juice.new("いろはす",120)
    # 初期状態で、ペプシ(150円)を5本格納している m
    # 初期在庫にモンスター(230円)5本を追加する。
    # 初期在庫にいろはす(120円)5本を追加する。
    @stock = []
    5.times do
      @stock << @p_juice
      @stock << @m_juice
      @stock << @i_juice
    end
    # 売上金額は外部から取得できない
    @sell = 0
  end

  # Suicaにチャージ
  def charge(amount)
    @suica = Suica.new
    @current_charge = @suica.charge(amount)
  end
  
  # 自動販売機は在庫を取得できる
  def p_stock #ペプシ
    pepsi = @stock.select { |n| n == @p_juice }
    pepsi.size
  end

  def m_stock #モンスター
    monster =  @stock.select { |n| n == @m_juice }
    monster.size
  end

  def i_stock # いろはす
    irohasu = @stock.select { |n| n == @i_juice }
    irohasu.size
  end

  # 自動販売機は購入可能なドリンクのリストを取得できる
  def list
    p "購入可能リスト"
    p "ペプシ #{p_stock}本"     if p_stock >= 1
    p "モンスター #{m_stock}本"  if m_stock >= 1
    p "いろはす #{i_stock}本"    if i_stock >= 1
  end

  # 自動販売機に在庫を補充できるようにする
  def put_in(name)
    @stock << @p_juice if name == "ペプシ"
    @stock << @m_juice if name == "モンスター"
    @stock << @i_juice if name == "いろはす"
  end

  def buy(name)
    # ジュース値段以上のチャージ残高がある条件下
    if name == "ペプシ" && p_stock > 0
        # 自動販売機はジュースの在庫を減らす
        p_stock.size
        @stock.delete_at(@stock.index(@p_juice))
        p_stock.size
        # Suicaのチャージ残高を減らす
        @suica.buy(@p_juice.price)
        # 売り上げ金額を増やす
        @sell += @p_juice.price
    elsif name == "モンスター" && m_stock > 0
        @stock.delete_at(@stock.index(@m_juice))
        @suica.buy(@m_juice.price)
        @sell += @m_juice.price
    elsif name == "いろはす" && i_stock > 0 
        @stock.delete_at(@stock.index(@i_juice))
        @suica.buy(@i_juice.price)
        @sell += @i_juice.price
    # 在庫がない場合は例外を発生させる
    elsif p_stock <= 0
      raise "ペプシは売り切れです"
    elsif m_stock <= 0
      raise "モンスターは売り切れです"
    elsif i_stock <= 0
      raise "いろはすは売り切れです"
    end
  end
end