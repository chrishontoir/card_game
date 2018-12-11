class Player

  attr_accessor :player_name, :player_health, :player_decks

  def initialize(player_name, player_health, player_decks)
    @player_name = player_name
    @player_health = player_health
    @player_decks = player_decks
  end

  def player_lose_health(value)
    @player_health -= value
  end

  def player_gain_health(value)
    @player_health += value
  end

  def player_deck_count
    return @player_decks.length
  end

  def player_add_deck(deck)
    @player_decks.push(deck)
  end

  def player_remove_deck(deck)
    @player_decks.delete(deck)
  end


end
