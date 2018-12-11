require('minitest/autorun')
require('minitest/rg')
require_relative('../deck.rb')
require_relative('../card.rb')

class DeckTest < MiniTest::Test

  def setup
    @deck1 = Deck.new([])
    @mercenary = Card.new("Mercenary", 5, 5, 2)
    @archer = Card.new("Archer", 3, 6, 1)
  end

  def test_card_array
    assert_equal([], @deck1.card_array)
  end

  def test_deck_count
    assert_equal(0, @deck1.deck_count)
  end

  def test_add_card_to_deck
    @deck1.add_card_to_deck(@archer)
    assert_equal(1, @deck1.deck_count)
    p @deck1.card_array
  end

  def test_remove_card_from_deck_by_name
    @deck1.add_card_to_deck(@archer)
    @deck1.remove_card_from_deck(@archer)
    assert_equal(0, @deck1.deck_count)
  end


end
