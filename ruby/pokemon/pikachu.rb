require './pokemon.rb'

class Pikachu < Pokemon
  def attack
      super
      p "#{@name}の10万ボルト！"
  end
end

