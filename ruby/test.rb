require './vending.rb'

vending = Vending.new
# チャージ金額が足りなくなるとエラーが出ることを確認
# vending.charge(100)
vending.charge(5000)
# 100円未満はチャージできないことを確認
# vending.charge(10)
# 購入リスト確認(各商品が5本ずつ)
vending.list
# 在庫補充
vending.put_in("ペプシ",150)
vending.put_in("いろはす",120)
vending.put_in("モンスター",230)
#ペプシ購入
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
#ペプシ売り切れ (6 - 6 = 0)
p vending.stock("ペプシ").size
# ペプシを購入しようとするとエラー(次の処理が進まないので確認後コメントアウト)
# vending.buy("ペプシ")
# ペプシ補充
vending.put_in("ペプシ",150)
# 再びペプシが買えることを確認
vending.buy("ペプシ")
# いろはす、モンスター購入↓
vending.buy("いろはす")
vending.buy("いろはす")
vending.buy("いろはす")
vending.buy("モンスター")
vending.buy("モンスター")
# 在庫リスト確認(いろはす:3 モンスター:4)
p vending.stock("いろはす").size
p vending.stock("モンスター").size
# いろはす、モンスターが表示されることを確認
vending.list
