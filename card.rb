class Card

  attr_reader :name, :health, :damage, :cost

  def initialize(name, health, damage, cost)
    @name = name
    @health = health
    @damage = damage
    @cost = cost
  end

  def card_details
    return "#{name} | Health: #{health} | Damage: #{damage} | Cost: #{cost}"
  end


end
