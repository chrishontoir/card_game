class Player

  attr_accessor :player_name, :player_health, :player_power, :player_decks, :player_chosen_deck, :player_played

  def initialize(player_name, player_health, player_power, player_decks, player_chosen_deck, player_played)
    @player_name = player_name
    @player_health = player_health
    @player_power = player_power
    @player_decks = player_decks
    @player_chosen_deck = player_chosen_deck
    @player_played = player_played
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

  def player_gain_power(value)
    @player_power += value
  end


end
