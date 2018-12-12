require_relative('card.rb')
require_relative('deck.rb')
require_relative('player.rb')

def create_new_game
  @player1 = Player.new("", 30, 1, [], "", [])
  @player2 = Player.new("", 30, 1, [], "", [])

  @player1_played = []
  @player2_played = []

  @default_deck_1 = Deck.new("Default", [])
  @default_deck_2 = Deck.new("Default", [])
  # @player1_deck1 = Deck.new("Player1, Deck1", [])
  # @player2_deck1 = Deck.new("Player2, Deck1", [])

  @mercenary = Card.new("Mercenary", 5, 5, 2)
  @archer = Card.new("Archer", 3, 6, 1)
  @wizard = Card.new("Wizard", 4, 4, 4)
  @thief = Card.new("Thief", 2, 6, 3)
  @guard = Card.new("Guard", 2, 0, 1)

  @default_deck_1.add_card_to_deck(@mercenary)
  @default_deck_1.add_card_to_deck(@mercenary)
  @default_deck_1.add_card_to_deck(@archer)
  @default_deck_1.add_card_to_deck(@archer)
  @default_deck_1.add_card_to_deck(@wizard)
  @default_deck_2.add_card_to_deck(@mercenary)
  @default_deck_2.add_card_to_deck(@mercenary)
  @default_deck_2.add_card_to_deck(@archer)
  @default_deck_2.add_card_to_deck(@archer)
  @default_deck_2.add_card_to_deck(@wizard)
end

def get_player_names
  system "clear"

  p "Player 1 enter your name:"
  @player1.player_name = gets.chomp.capitalize

  system "clear"

  p "Player 2 enter your name:"
  @player2.player_name = gets.chomp.capitalize

  system "clear"

  p "Welcome #{@player1.player_name}."
  p "You have #{@player1.player_deck_count} decks."

  p "----------"

  p "Welcome #{@player2.player_name}."
  p "You have #{@player2.player_deck_count} decks."
end

def setup_decks
  if @player1.player_deck_count == 0
    @player1.player_add_deck(@default_deck_1)
    p "#{@player1.player_name} has been assigned the Default Deck."
  end

  if @player2.player_deck_count == 0
    @player2.player_add_deck(@default_deck_2)
    p "#{@player2.player_name} has been assigned the Default Deck."
  end
end

def available_cards
  p "AVAILABLE CARDS:"
  p @mercenary.card_details
  p @archer.card_details
  p @wizard.card_details
  p @thief.card_details
  p @guard.card_details
end

def build_new_deck(player)
  counter = 0
  p "Enter a deck name:"
  deck_name = gets.chomp
  new_deck = Deck.new("#{deck_name}", [])
  player.player_add_deck(new_deck)
  system "clear"
  # p player.player_decks
  p "You now have #{player.player_deck_count} decks."
  p "----------"
  available_cards()
  p "----------"
  p "Add cards to your new deck (#{deck_name.upcase}):"
  while counter < 5

    new_card = gets.chomp
    new_card.downcase!
    if new_card == "wizard" || new_card == "wiz"
      player.player_decks[-1].card_array.push(@wizard)
      counter += 1
      p "#{counter} / 5"
    elsif new_card == "mercenary" || new_card == "merc"
      player.player_decks[-1].card_array.push(@mercenary)
      counter += 1
      p "#{counter} / 5"
    elsif new_card == "archer" || new_card == "arc"
      player.player_decks[-1].card_array.push(@archer)
      counter += 1
      p "#{counter} / 5"
    elsif new_card == "thief" || new_card == "thi"
      player.player_decks[-1].card_array.push(@thief)
      counter += 1
      p "#{counter} / 5"
    elsif new_card == "guard" || new_card == "gua"
      player.player_decks[-1].card_array.push(@guard)
      counter += 1
      p "#{counter} / 5"
    elsif new_card == "delete" || new_card == "remove" || new_card == "-"
      player.player_decks[-1].card_array.pop()
      counter -= 1
      p "#{counter} / 5"
    elsif new_card == "?" || new_card == "help" || new_card == "info"
      p "HELP - Type the name of a card that you want to add to your deck. To remove a card from your deck, type 'delete', 'remove' or '-'."
    elsif new_card == "cancel"
      system "clear"
      player_options(player)
    else
      p "I don't recognise that command, try again..."
    end
  end
  p "----------"
  p "New deck created (#{deck_name.upcase}):"
  for card in player.player_decks[-1].card_array
      p card.card_details
  end
end

# def build_new_deck_player_1
#   counter = 0
#   @player1.player_add_deck(@player1_deck1)
#   system "clear"
#   p "You now have #{@player1.player_deck_count} decks."
#   p "----------"
#   available_cards()
#   p "----------"
#   p "Add cards to your new deck:"
#   while counter < 5
#
#     new_card = gets.chomp
#     new_card.downcase!
#     if new_card == "wizard" || new_card == "wiz"
#       @player1.player_decks[-1].card_array.push(@wizard)
#       counter += 1
#       p "#{counter} / 5"
#     elsif new_card == "mercenary" || new_card == "merc"
#       @player1.player_decks[-1].card_array.push(@mercenary)
#       counter += 1
#       p "#{counter} / 5"
#     elsif new_card == "archer" || new_card == "arc"
#       @player1.player_decks[-1].card_array.push(@archer)
#       counter += 1
#       p "#{counter} / 5"
#     elsif new_card == "thief" || new_card == "thi"
#       @player1.player_decks[-1].card_array.push(@thief)
#       counter += 1
#       p "#{counter} / 5"
#     elsif new_card == "delete" || new_card == "remove" || new_card == "-"
#       @player1.player_decks[-1].card_array.pop()
#       counter -= 1
#       p "#{counter} / 5"
#     elsif new_card == "?" || new_card == "help" || new_card == "info"
#       p "HELP - Type the name of a card that you want to add to your deck. To remove a card from your deck, type 'delete', 'remove' or '-'."
#     elsif new_card == "cancel"
#       system "clear"
#       player_options(@player1)
#     else
#       p "I don't recognise that command, try again..."
#     end
#   end
#   p "----------"
#   p "New deck created: "
#   for card in @player1.player_decks[-1].card_array
#       p card.card_details
#   end
# end

def player_options(player)
  p "#{player.player_name}, would you like to view your decks (y/n), or build a new deck (build)?"
  player_answer = gets.chomp.downcase

  if player_answer == "y"
    system "clear"
    show_player_decks(player)
    player_options(player)
  elsif player_answer == "build"
    build_new_deck(player)
    p "----------"
    p "Would you like to save or delete this deck?"
    continue_answer = gets.chomp
      if continue_answer == "delete"
        system "clear"
        p "Deck deleted"
        player.player_decks.pop()
      elsif continue_answer != "save" && continue_answer != "delete"
        p "That option was not recognised. Try again."
      end
      player_options(player)
  elsif player_answer != "y" && player_answer != "build" && player_answer != "n"
    system "clear"
    p "Option not recognised, try again."
    player_options(player)
  end
end

def show_player_decks(player)
  total_decks = player.player_deck_count
  counter = 0
  p "PLAYER: #{player.player_name.upcase}"
  p "----------"
  for deck in player.player_decks
    p "DECK: #{player.player_decks[counter].name.upcase}"
    # p @player1.player_decks[0].
    for card in player.player_decks[counter].card_array
      p card.card_details
    end
    counter += 1
    p "----------"
  end
end

def player_choose_deck(player)
  p "#{player.player_name}, choose which deck you would like to use:"
  all_decks = []
  # p player.player_decks[0].name
  # player_deck_choice = gets.chomp

  for deck in player.player_decks
    all_decks.push(deck.name)
  end
  p all_decks
  player_deck_choice = gets.chomp
  player.player_chosen_deck = player_deck_choice
  p player.player_chosen_deck
  p "----------"
end

def play_card(player, deck_index)
  p "Enter the position of the card you want to play."
  player_position = gets.chomp
  # player1_position -= 1
  if player.player_decks[deck_index].card_array[(player_position.to_i) - 1].cost <= player.player_power
    player.player_played.unshift(player.player_decks[deck_index].card_array[(player_position.to_i) - 1])
    player.player_decks[deck_index].card_array.delete_at((player_position.to_i) - 1)
    total_damage = 0
    for card in player.player_played
      p card.card_details
      total_damage += card.damage
    end
    p total_damage
  else
    p "Not enough power to play that card."
    play_card(player, deck_index)
  end
end

def player_turn(player)
  # system "clear"
  p "------------------------------"
  p "-----------WELCOME!-----------"
  p "------------------------------"
  p "PLAYER: #{player.player_name}"
  p "HEALTH: #{player.player_health}, POWER: #{player.player_power}"
  p "----------"
  for deck in player.player_decks
    if deck.name.upcase == player.player_chosen_deck.upcase
      deck_index = player.player_decks.index(deck)
      for card in deck.card_array
        p card.card_details
      end
      if deck.deck_count == 0
        p "No cards remaining."
      end
    end
  end
  p "----------"
  play_card(player, deck_index)
  # p "Enter the position of the card you want to play."
  # player_position = gets.chomp
  # # player1_position -= 1
  # if player.player_decks[deck_index].card_array[(player_position.to_i) - 1].cost <= player.player_power
  #   player.player_played.unshift(player.player_decks[deck_index].card_array[(player_position.to_i) - 1])
  #   player.player_decks[deck_index].card_array.delete_at((player_position.to_i) - 1)
  #   total_damage = 0
  #   for card in player.player_played
  #     p card.card_details
  #     total_damage += card.damage
  #   end
  #   p total_damage
  # else
  #   system "clear"
  #   p "Not enough power to play that card."
  #   # player_turn(player)
  # end
  p "----------"
  p "Continue? (y/n):"
  player_continue = gets.chomp
  system "clear"

  player.player_gain_power(1)
end

def play_game(player1, player2)
  while player1.player_health > 0 || player2.player_health > 0
    player_turn(player1)
    player_turn(player2)
  end

  if player1.player_health == 0
    p "#{player2.player_name} wins!"
  end

  if player2.player_health == 0
    p "#{player1.player_name} wins!"
  end
end

# def play_game(player1, player2)
#   player1_power = 1
#   player2_power = 1
#   while player1.player_health > 0 || player2.player_health > 0
#     system "clear"
#     p "------------------------------"
#     p "-----------WELCOME!-----------"
#     p "------------------------------"
#     p "PLAYER: #{player1.player_name}"
#     p "HEALTH: #{player1.player_health}, POWER: #{player1_power}"
#     p "----------"
#     for deck1 in player1.player_decks
#       if deck1.name.upcase == player1.player_chosen_deck.upcase
#         deck1_index = player1.player_decks.index(deck1)
#         for card1 in deck1.card_array
#           p card1.card_details
#         end
#         if deck1.deck_count == 0
#           p "No cards remaining."
#         end
#       end
#     end
#     p "----------"
#     p "Enter the position of the card you want to play."
#     player1_position = gets.chomp
#     # player1_position -= 1
#     @player1_played.unshift(player1.player_decks[deck1_index].card_array[(player1_position.to_i) - 1].card_details)
#     player1.player_decks[deck1_index].card_array.delete_at((player1_position.to_i) - 1)
#     for card1 in @player1_played
#       p card1
#     end
#     p "----------"
#     p "Continue? (y/n):"
#     player_continue = gets.chomp
#     system "clear"
#
#     p "------------------------------"
#     p "-----------WELCOME!-----------"
#     p "------------------------------"
#     p "PLAYER: #{player2.player_name}"
#     p "HEALTH: #{player2.player_health}, POWER: #{player2_power}"
#     p "----------"
#     for deck2 in player2.player_decks
#       if deck2.name.upcase == player2.player_chosen_deck.upcase
#         deck2_index = player2.player_decks.index(deck2)
#         for card2 in deck2.card_array
#           if deck2.deck_count != 0
#             p card2.card_details
#           else
#             p "No cards remaining"
#           end
#         end
#       end
#     end
#
#     p "----------"
#     p "Enter the position of the card you want to play."
#     player2_position = gets.chomp
#     # player1_position -= 1
#     @player2_played.unshift(player2.player_decks[deck2_index].card_array[(player2_position.to_i) - 1].card_details)
#     player2.player_decks[deck2_index].card_array.delete_at((player2_position.to_i) - 1)
#     for card2 in @player2_played
#       p card2
#     end
#     p "----------"
#     p "Continue? (y/n):"
#     player2_continue = gets.chomp
#     system "clear"
#
#     player1_power += 1 if player1_power < 5
#     player2_power += 1 if player2_power < 5
#
#     # p player1.player_decks[deck_index].card_array
#
#   end
# end

def pre_game
  player_options(@player1)

  player_options(@player2)

  system "clear"

  player_choose_deck(@player1)

  player_choose_deck(@player2)

  p "Ready to start? (y/n)"
  start_answer = gets.chomp

  if start_answer == "y"
    system "clear"
    p "Let's begin!"
    play_game(@player1, @player2)
  else
    pre_game()
  end
end

# GAME RUNNING
create_new_game()

get_player_names()

p "----------"

setup_decks()

p "----------"

pre_game()








# p "#{@player1.player_name}, would you like to view your cards (y/n), or build a new deck (build)?"
# player1_answer = gets.chomp
#
# if player1_answer == "y"
#   system "clear"
#   p "#{@player1.player_name}'s cards:"
#   # p @player1.player_decks[0].
#   for card in @player1.player_decks[0].card_array
#     p card.card_details
#   end
#   p "----------"
# elsif player1_answer == "build"
#   build_new_deck_player_1()
#   p "----------"
#   p "#{@player1.player_name}, are you ready to continue? (y/n):"
#   continue_answer = gets.chomp
# end
#
# p "#{@player2.player_name}, would you like to view your cards (y/n), or build a new deck (build)?"
# player1_answer = gets.chomp
#
# if player1_answer == "y"
#   system "clear"
#   p "#{@player2.player_name}'s cards:"
#   # p @player1.player_decks[0].
#   for card in @player2.player_decks[0].card_array
#     p card.card_details
#   end
#   p "----------"
# elsif player1_answer == "build"
#   build_new_deck(@player2)
# end
