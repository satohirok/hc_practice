require "./pokemon.rb"

class Zenigame < Pokemon
  def attack
    super
    p "#{@name}のみずでっぽう！"
  end
end


