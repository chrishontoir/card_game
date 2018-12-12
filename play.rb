require_relative('card.rb')
require_relative('deck.rb')
require_relative('player.rb')

def create_new_game
  @player1 = Player.new("", 30, [], "")
  @player2 = Player.new("", 30, [], "")

  @default_deck = Deck.new("Default", [])
  # @player1_deck1 = Deck.new("Player1, Deck1", [])
  # @player2_deck1 = Deck.new("Player2, Deck1", [])

  @mercenary = Card.new("Mercenary", 5, 5, 2)
  @archer = Card.new("Archer", 3, 6, 1)
  @wizard = Card.new("Wizard", 4, 4, 4)
  @thief = Card.new("Thief", 2, 6, 3)
  @guard = Card.new("Guard", 2, 0, 1)

  @default_deck.add_card_to_deck(@mercenary)
  @default_deck.add_card_to_deck(@mercenary)
  @default_deck.add_card_to_deck(@archer)
  @default_deck.add_card_to_deck(@archer)
  @default_deck.add_card_to_deck(@wizard)
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
    @player1.player_add_deck(@default_deck)
    p "#{@player1.player_name} has been assigned the Default Deck."
  end

  if @player2.player_deck_count == 0
    @player2.player_add_deck(@default_deck)
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
end

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
