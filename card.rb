class Card

  attr_reader :name, :damage, :healing, :cost

  def initialize(name, damage, healing, cost)
    @name = name
    @damage = damage
    @healing = healing
    @cost = cost
  end

  def card_details
    return "#{name} | Damage: #{damage} | Healing: #{healing} | Cost: #{cost}"
  end


end
