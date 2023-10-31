require './vending.rb'

vending = Vending.new
vending.charge(100)
# 購入リスト確認(各商品が5本ずつ)
vending.list
# 在庫補充
vending.put_in("ペプシ",150)
vending.put_in("いろはす",120)
vending.put_in("モンスター",230)
# 購入リスト確認(各商品が6本ずつ)
vending.list
vending.st
#ペプシ購入
vending.buy("ペプシ",150)
vending.buy("ペプシ",150)
vending.buy("ペプシ",150)
vending.buy("ペプシ",150)
vending.buy("ペプシ",150)
# 購入リスト確認(ペプシが1本)
p vending.stock("ペプシ").size
# ペプシ購入
vending.buy("ペプシ",150)
#ペプシ売り切れ (6 - 6 = 0)
p vending.stock("ペプシ").size
vending.buy("ペプシ",150)
vending.list
# ペプシを購入しようとするとエラー(次の処理が進まないので確認後コメントアウト)
# vending.buy("ペプシ",150)
# ペプシ補充
# vending.put_in("ペプシ",150)
# 再びペプシが買えることを確認
# いろはす、モンスター購入↓
vending.buy("いろはす",120)
vending.buy("いろはす",120)
vending.buy("いろはす",120)
vending.buy("モンスター",230)
vending.buy("モンスター",230)
# 購入リスト確認(いろはす:3 モンスター:4)
vending.list
vending.st
