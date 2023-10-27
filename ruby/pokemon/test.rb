require "./pikachu.rb"
require "./zenigame.rb"

# ピカチュウ
pika = Pikachu.new("ピカチュウ","でんき","",100)
pika.attack
pika.change_name("ライチュウ")
pika.attack

# ゼニガメ
zeni = Zenigame.new("ゼニガメ","みず","",100)
zeni.attack
zeni.change_name("カメール")
zeni.attack

# 不適切な名前に変更
pika.change_name("うんこ")
zeni.change_name("うんこ")



