class Card

  attr_reader :name, :health, :damage, :effect

  def initialize(name, health, damage, effect)
    @name = name
    @health = health
    @damage = damage
    @effect = effect
  end


end
