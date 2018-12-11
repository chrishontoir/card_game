require('minitest/autorun')
require('minitest/rg')
require_relative('../card.rb')

class CardTest < MiniTest::Test

  def setup
    @mercenary = Card.new("Mercenary", 5, 5, 2)
    @archer = Card.new("Archer", 3, 6, 1)
  end

  def test_name
    assert_equal("Mercenary", @mercenary.name)
  end

  def test_health
    assert_equal(3, @archer.health)
  end

  def test_damage
    assert_equal(6, @archer.damage)
  end

  def test_cost
    assert_equal(2, @mercenary.cost)
  end

  def test_card_details
    assert_equal("Archer | Health: 3 | Damage: 6 | Cost: 1", @archer.card_details)
  end
end
