require './pokemon.rb'

class Pikachu < Pokemon
  def attack
      super
      p "#{@name}の10万ボルト！"
  end
end

pika = Pikachu.new("ピカチュウ","でんき","",100)
pika.attack
pika.change_name("うんこ")
pika.attack