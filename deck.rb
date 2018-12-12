class Deck

  attr_reader :name, :card_array

  def initialize(name, card_array)
    @name = name
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
