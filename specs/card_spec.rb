require('minitest/autorun')
require('minitest/rg')
require_relative('../card.rb')

class CardTest < MiniTest::Test

  def setup
    @card = Card.new("Name", 5, 5, 2)
  end

  def test_name
    assert_equal("Name", @card.name)
  end

  def test_health
    assert_equal(5, @card.health)
  end

  def test_damage
    assert_equal(5, @card.damage)
  end

  def test_effect
    assert_equal(2, @card.effect)
  end
end
