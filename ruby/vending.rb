require "./suica.rb"
require "./juice.rb"

class Vending < Suica
  def initialize
    @suica
    @current_charge = 0
    # 初期状態で、ペプシ(150円)を5本格納している m
    # 初期在庫にモンスター(230円)5本を追加する。
    # 初期在庫にいろはす(120円)5本を追加する。
    @stock = []
    5.times do
      @stock << Juice.new("ペプシ",150).name
      @stock << Juice.new("モンスター",230).name
      @stock << Juice.new("いろはす",120).name
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
  def stock(name)
    @stock.select{|n| n == name}
  end

  # 自動販売機は購入可能なドリンクのリストを取得できる
  def list
    p "購入可能リスト"
    p "ペプシ" if stock("ペプシ").size >= 0
    p "モンスター" if stock("モンスター").size >= 0
    p "いろはす" if stock("いろはす").size >= 0
  end

  # 自動販売機に在庫を補充できるようにする
  def put_in(name,price)
    juice = Juice.new(name,price)
    @stock << juice.name
  end

  def buy(name,price)
    juice = Juice.new(name,price)
    # ジュース値段以上のチャージ残高がある条件下
    raise "#{name} は売り切れです" if stock(name).size == 0
    raise "チャージ残高が不足しています" if juice.price > @suica.current_charge
    # 自動販売機はジュースの在庫を減らす
    @stock.delete_at(@stock.index(juice.name)) 
    # Suicaのチャージ残高を減らす
    @suica.buy(juice.price)
    # 売り上げ金額を増やす
    @sell += juice.price
  end
end




