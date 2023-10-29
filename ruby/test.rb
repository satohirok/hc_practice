require './vending.rb'

vending = Vending.new
vending.charge(5000)
# 購入リスト確認(各商品が5本ずつ)
vending.list
# 在庫補充
vending.put_in("ペプシ")
vending.put_in("いろはす")
vending.put_in("モンスター")
# 購入リスト確認(各商品が6本ずつ)
vending.list
#ペプシ購入
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
# 購入リスト確認(ペプシが1本)
vending.list
# ペプシ購入
vending.buy("ペプシ")
#ペプシ売り切れ (6 - 6 = 0)
vending.list
# ペプシを購入しようとするとエラー(次の処理が進まないので確認後コメントアウト)
# vending.buy("ペプシ")
# ペプシ補充
vending.put_in("ペプシ")
# 再びペプシが買えることを確認
# いろはす、モンスター購入↓
vending.buy("いろはす")
vending.buy("いろはす")
vending.buy("いろはす")
vending.buy("モンスター")
vending.buy("モンスター")
# 購入リスト確認(いろはす:3 モンスター:4)
vending.list