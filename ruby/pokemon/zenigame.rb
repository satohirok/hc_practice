require "./pokemon.rb"

class Zenigame < Pokemon
  def attack
    super
    p "#{@name}のみずでっぽう！"
  end
end

zeni = Zenigame.new("ゼニガメ","みず","",100)
zeni.attack
zeni.change_name("うんこ")
zeni.attack
