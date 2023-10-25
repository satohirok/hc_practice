require './vending.rb'

# 引数にSuicaへのチャージ金額を指定(5000円チャージ)
vending = Vending.new(5000)
#購入リスト確認
vending.list
#ペプシ購入
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
vending.buy("ペプシ")
#ペプシ売り切れ (5 - 5 = 0)
#在庫確認
p vending.p_stock
#ペプシ補充→在庫1であることを確認(0 + 1 = 1)
p vending.put_in("ペプシ")
# ペプシが購入できることを確認
vending.buy("ペプシ")
#いろはす、モンスター購入↓
vending.buy("いろはす")
vending.buy("いろはす")
vending.buy("いろはす")
vending.buy("モンスター")
vending.buy("モンスター")
# いろはすの在庫数確認(5 - 3 = 2)
p vending.i_stock
# いろはす補充 (2 + 1 = 3)
p vending.put_in("いろはす")
# モンスターの在庫数確認(5 - 2 = 3)
p vending.m_stock
# モンスター補充(3 + 1 = 4)
p vending.put_in("モンスター")
# 売上金額取得(ペプシ150 * 6 = 900 + いろはす120 * 3 = 360 + モンスター230 * 2 = 460 合計:1720)
p vending.sell
# 購入処理後のSuicaチャージ残高を確認(5500 - 1720 = 3780)
p vending.current_charge





