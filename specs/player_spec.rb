require('minitest/autorun')
require('minitest/rg')
require_relative('../player.rb')
require_relative('../deck.rb')

class PlayerTest < MiniTest::Test

  def setup
    @player1 = Player.new("Chris", 30, [])
    @deck1 = Deck.new([])
  end

  def test_player_name
    assert_equal("Chris", @player1.player_name)
  end

  def test_player_health
    assert_equal(30, @player1.player_health)
  end

  def test_player_decks
    assert_equal([], @player1.player_decks)
  end

  def test_player_loses_health
    assert_equal(25, @player1.player_lose_health(5))
  end

  def test_player_gains_health
    assert_equal(32, @player1.player_gain_health(2))
  end

  def test_player_deck_count
    assert_equal(0, @player1.player_deck_count)
  end

  def test_player_add_deck
    @player1.player_add_deck(@deck1)
    assert_equal(1, @player1.player_deck_count)
  end

  def test_player_remove_deck
    @player1.player_add_deck(@deck1)
    @player1.player_remove_deck(@deck1)
    assert_equal(0, @player1.player_deck_count)
  end

end
