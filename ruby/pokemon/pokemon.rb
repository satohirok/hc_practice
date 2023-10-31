class Pokemon
  def initialize(name,type_1,type_2,hp)
      @name = name
      @type_1 = type_1
      @type_2 = type_2
      @hp = hp
  end

  def attack
      p "#{@name}のこうげき！"
  end

  def change_name(name)
      @name = name
      if @name == "うんこ"
        p "不適切な名前です"
        exit
      end
  end
end

