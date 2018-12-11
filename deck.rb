class Deck

  attr_reader :card_array

  def initialize(card_array)
    @card_array = card_array
  end

  def deck_count
    return @card_array.length
  end

  def add_card_to_deck(card)
    @card_array.push(card)
  end

  def remove_card_from_deck(card)
    @card_array.delete(card)
  end
end
