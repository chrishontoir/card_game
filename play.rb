require_relative('card.rb')
require_relative('deck.rb')
require_relative('player.rb')
require('colorize')

def create_new_game
  @player1 = Player.new("", 30, 1, [], "", [], [])
  @player2 = Player.new("", 30, 1, [], "", [], [])

  @game_active = true

  @damage = 0

  @player1_played = []
  @player2_played = []

  @player1_deck = Deck.new("Player Playing Deck", [])
  @player2_deck = Deck.new("Player 2 Playing Deck", [])

  @default_deck_1 = Deck.new("Default", [])
  @default_deck_2 = Deck.new("Default", [])
  # @player1_deck1 = Deck.new("Player1, Deck1", [])
  # @player2_deck1 = Deck.new("Player2, Deck1", [])

  # @mercenary = Card.new("Mercenary", 5, 5, 2)
  # @archer = Card.new("Archer", 3, 6, 1)
  # @wizard = Card.new("Wizard", 4, 4, 4)
  # @thief = Card.new("Thief", 2, 6, 3)
  # @guard = Card.new("Guard", 2, 0, 1)

  @lightning_bolt = Card.new("Lightning Bolt", 4, 0, 3)
  @wounding_strike = Card.new("Wounding Strike", 5, 0, 4)
  @crushing_blow = Card.new("Crushing Blow", 6, 0, 5)
  @glancing_hit = Card.new("Glancing Hit", 2, 0, 1)
  @snowball = Card.new("Snowball", 3, 0, 2)
  @bite = Card.new("Bite", 1, 1, 1)
  @health_potion = Card.new("Health Potion", 0, 3, 2)
  @greater_health_potion = Card.new("Greater Health Potion", 0, 5, 4)
  @bandage = Card.new("Bandage", 0, 2, 1)


  @default_deck_1.add_card_to_deck(@bite)
  @default_deck_1.add_card_to_deck(@glancing_hit)
  @default_deck_1.add_card_to_deck(@snowball)
  @default_deck_1.add_card_to_deck(@lightning_bolt)
  @default_deck_1.add_card_to_deck(@wounding_strike)
  @default_deck_1.add_card_to_deck(@crushing_blow)
  @default_deck_1.add_card_to_deck(@bandage)
  @default_deck_1.add_card_to_deck(@bandage)
  @default_deck_1.add_card_to_deck(@health_potion)
  @default_deck_1.add_card_to_deck(@greater_health_potion)

  @default_deck_2.add_card_to_deck(@bite)
  @default_deck_2.add_card_to_deck(@glancing_hit)
  @default_deck_2.add_card_to_deck(@snowball)
  @default_deck_2.add_card_to_deck(@lightning_bolt)
  @default_deck_2.add_card_to_deck(@wounding_strike)
  @default_deck_2.add_card_to_deck(@crushing_blow)
  @default_deck_2.add_card_to_deck(@bandage)
  @default_deck_2.add_card_to_deck(@bandage)
  @default_deck_2.add_card_to_deck(@health_potion)
  @default_deck_2.add_card_to_deck(@greater_health_potion)
end

def get_player_names
  system "clear"

  puts "Player 1 enter your name:"
  @player1.player_name = gets.chomp.capitalize

  system "clear"

  puts "Player 2 enter your name:"
  @player2.player_name = gets.chomp.capitalize

  system "clear"

  puts "Welcome #{@player1.player_name}."
  puts "You have #{@player1.player_deck_count} decks."

  puts "----------".white

  puts "Welcome #{@player2.player_name}."
  puts "You have #{@player2.player_deck_count} decks."
end

def setup_decks
  if @player1.player_deck_count == 0
    @player1.player_add_deck(@default_deck_1)
    puts "#{@player1.player_name} has been assigned the Default Deck."
  end

  if @player2.player_deck_count == 0
    @player2.player_add_deck(@default_deck_2)
    puts "#{@player2.player_name} has been assigned the Default Deck."
  end
end

def available_cards
  puts "AVAILABLE CARDS:"
  puts @bite.card_details
  puts @glancing_hit.card_details
  puts @snowball.card_details
  puts @lightning_bolt.card_details
  puts @wounding_strike.card_details
  puts @crushing_blow.card_details
  puts "----------".white
  puts @bandage.card_details
  puts @health_potion.card_details
  puts @greater_health_potion.card_details
end

def add_card_to_new_deck(card_name, new_card)
  if new_card == card_name.name
    player.player_decks[-1].card_array.push(card_name)
    counter += 1
    puts "Added: #{card_name.name} (#{counter}/5)"
  end
end

def build_new_deck(player)
  counter = 0
  puts "Enter a deck name:"
  deck_name = gets.chomp
  new_deck = Deck.new("#{deck_name}", [])
  player.player_add_deck(new_deck)
  system "clear"
  # p player.player_decks
  puts "You now have #{player.player_deck_count} decks."
  puts "----------".white
  available_cards()
  puts "----------".white
  puts "Add cards to your new deck (#{deck_name.upcase}):"
  while counter < 10

    new_card = gets.chomp
    new_card.downcase!
    if new_card == "bite"
      player.player_decks[-1].card_array.push(@bite)
      counter += 1
      puts "Added: #{@bite.name} (#{counter}/10)"
    elsif new_card == "glancing hit" || new_card == "glancing"
      player.player_decks[-1].card_array.push(@glancing_hit)
      counter += 1
      puts "Added: #{@glancing_hit.name} (#{counter}/10)"
    elsif new_card == "snowball" || new_card == "snow"
      player.player_decks[-1].card_array.push(@snowball)
      counter += 1
      puts "Added: #{@snowball.name} (#{counter}/10)"
    elsif new_card == "lightning bolt" || new_card == "lightning"
      player.player_decks[-1].card_array.push(@lightning_bolt)
      counter += 1
      puts "Added: #{@lightning_bolt.name} (#{counter}/10)"
    elsif new_card == "wounding strike" || new_card == "wounding"
      player.player_decks[-1].card_array.push(@wounding_strike)
      counter += 1
      puts "Added: #{@wounding_strike.name} (#{counter}/10)"
    elsif new_card == "crushing blow" || new_card == "crushing"
      player.player_decks[-1].card_array.push(@crushing_blow)
      counter += 1
      puts "Added: #{@crushing_blow.name} (#{counter}/10)"
    elsif new_card == "bandage"
      player.player_decks[-1].card_array.push(@bandage)
      counter += 1
      puts "Added: #{@bandage.name} (#{counter}/10)"
    elsif new_card == "health potion" || new_card == "health"
      player.player_decks[-1].card_array.push(@health_potion)
      counter += 1
      puts "Added: #{@health_potion.name} (#{counter}/10)"
    elsif new_card == "greater health potion" || new_card == "greater health"
      player.player_decks[-1].card_array.push(@greater_health_potion)
      counter += 1
      puts "Added: #{@greater_health_potion.name} (#{counter}/10)"
    elsif new_card == "delete" || new_card == "remove" || new_card == "-"
      player.player_decks[-1].card_array.pop()
      counter -= 1
      puts "Deleted last card: (#{counter}/10)"
    elsif new_card == "?" || new_card == "help" || new_card == "info"
      puts "HELP - Type the name of a card that you want to add to your deck. To remove a card from your deck, type 'delete', 'remove' or '-'."
    elsif new_card == "cancel"
      system "clear"
      player_options(player)
    else
      puts "I don't recognise that command, try again..."
    end
  end
  puts "----------".white
  puts "New deck created (#{deck_name.upcase}):"
  for card in player.player_decks[-1].card_array
      puts card.card_details
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
  puts "#{player.player_name}, would you like to view your decks (y/n), or build a new deck (build)?"
  player_answer = gets.chomp.downcase

  if player_answer == "y"
    system "clear"
    show_player_decks(player)
    player_options(player)
  elsif player_answer == "build"
    build_new_deck(player)
    puts "----------".white
    puts "Would you like to save or delete this deck?"
    continue_answer = gets.chomp
      if continue_answer == "delete"
        system "clear"
        puts "Deck deleted"
        player.player_decks.pop()
      elsif continue_answer != "save" && continue_answer != "delete"
        puts "That option was not recognised. Try again."
      end
      player_options(player)
  elsif player_answer != "y" && player_answer != "build" && player_answer != "n"
    system "clear"
    puts "Option not recognised, try again."
    player_options(player)
  end
end

def show_player_decks(player)
  total_decks = player.player_deck_count
  counter = 0
  puts "PLAYER: #{player.player_name.upcase}"
  puts "----------".white
  for deck in player.player_decks
    puts "DECK: #{player.player_decks[counter].name.upcase}"
    # p @player1.player_decks[0].
    for card in player.player_decks[counter].card_array
      puts card.card_details
    end
    counter += 1
    puts "----------".white
  end
end

def player_choose_deck(player)
  puts "#{player.player_name}, choose which deck you would like to use:"
  all_decks = []
  # p player.player_decks[0].name
  # player_deck_choice = gets.chomp

  for deck in player.player_decks
    all_decks.push(deck.name)
  end
  puts all_decks
  player_deck_choice = gets.chomp
  player.player_chosen_deck = player_deck_choice
  puts player.player_chosen_deck
  puts "----------".white
end

def play_card(player)
  if player.player_played.length == 0
    puts "You cannot play any more cards."
  else
    puts "Enter the position of the card you want to play."
    player_position = gets.chomp
    # player1_position -= 1
    if player_position == "" || player_position == "pass"
      p "You are about to skip your turn."
      p "Continue? (y/n)"
      skip_turn = gets.chomp
      if skip_turn == "n"
        play_card(player)
      elsif skip_turn == "y"
        p "Your turn was skipped."
      else
        p "Input not recognised."
      end
    elsif player_position.to_i > player.player_played.length
      p "Not a valid input."
      play_card(player)
    else
      if player.player_played[(player_position.to_i) - 1].cost <= player.player_power
        @damage = player.player_played[(player_position.to_i) -1].damage
        player.player_health += player.player_played[(player_position.to_i) -1].healing
        player.player_played.delete_at((player_position.to_i) - 1)
        # total_damage = 0
        # for card in player.player_played
        #   puts card.card_details
        #   total_damage += card.damage
        # end
        # puts total_damage
      else
        puts "Not enough power to play that card."
        play_card(player)
      end
    end
  end
end

def player_turn(player)
  # system "clear"
  # player.player_health -= @damage
  # puts "------------------------------"
  # puts "-----------WELCOME!-----------"
  # puts "------------------------------"
  # puts "PLAYER: #{player.player_name}"
  # puts "HEALTH: #{player.player_health}, POWER: #{player.player_power}"
  # puts "----------".white
  # p player.player_playing_deck[0].card_array
  # puts "----------".white
  for card in player.player_playing_deck[0].card_array
    if player.player_played.length < 5
      player.player_played << card
      player.player_playing_deck[0].card_array.shift
    end
  end
  if player.player_played.length > 0

    player.player_health -= @damage
    puts "------------------------------"
    puts "-----------WELCOME!-----------"
    puts "------------------------------"
    puts "PLAYER: #{player.player_name}"
    puts "HEALTH: #{player.player_health}, POWER: #{player.player_power}"
    puts "----------".white
    for card in player.player_played
      p card.card_details
      # if player.player_played.length == 0
      #   p "No cards remaining"
      #   end_game()
      #   break
      # end
    end

    puts "----------".white
    play_card(player)

    puts "----------".white
    puts "Continue? (y/n):"
    player_continue = gets.chomp
    system "clear"

    if player.player_power < 5
      player.player_gain_power(1)
    end
  else
    @game_active = false
    end_game(@player1, @player2)
  end
  # puts "----------".white
  # p player.player_playing_deck[0].card_array
  # p player.player_playing_deck[0].card_array


  # p "Enter the position of the card you want to play."
  # player_position = gets.chomp
  # player1_position -= 1
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

end

def play_game(player1, player2)
  for deck in player1.player_decks
    if deck.name.upcase == player1.player_chosen_deck.upcase
      # deck_index = player1.player_decks.index(deck)
      player1.player_playing_deck << deck
      player1.player_playing_deck[0].card_array.shuffle!
      # p player1.player_playing_deck
      # for card in deck.card_array
      #   puts card.card_details
      # end
    end
  end
  for deck in player2.player_decks
    if deck.name.upcase == player2.player_chosen_deck.upcase
      # deck_index = player2.player_decks.index(deck)
      player2.player_playing_deck << deck
      player2.player_playing_deck[0].card_array.shuffle!
      # p player2.player_playing_deck
      # for card in deck.card_array
      #   puts card.card_details
      # end
    end
  end
  # if player1.player_health == 0 || player2.player_health == 0 || (player1.player_played.length == 0 && player2.player_played.length == 0)
  #   player_turn(player1)
  #   player_turn(player2)
  # end
  while @game_active == true
    player_turn(player1)
    break if @game_active == false
    player_turn(player2)

  end
end

  # if player1.player_health == 0
  #   puts "#{player2.player_name} wins!"
  # end
  #
  # if player2.player_health == 0
  #   puts "#{player1.player_name} wins!"
  # end

#   if player1.player_played.length == 0 && player2.player_played.length == 0
#     if player1.player_health > player2.player_health
#       p "#{player1.player_name} wins!"
#     elsif player2.player_health > player1.player_health
#       p "#{player2.player_name} wins!"
#     elsif player1.player_health == player2.player_health
#       p "Draw!"
#     end
#   end
# end

def end_game(player1, player2)
  puts "Game Over"
  puts "#{player1.player_name}'s health: #{player1.player_health}."
  puts "#{player2.player_name}'s health: #{player2.player_health}."
  if player1.player_health > player2.player_health
    puts "#{player1.player_name} wins!"
  elsif player2.player_health > player1.player_health
    puts "#{player2.player_name} wins!"
  elsif player1.player_health == player2.player_health
    puts "Draw!"
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

  puts "Ready to start? (y/n)"
  start_answer = gets.chomp

  if start_answer == "y"
    system "clear"
    puts "Let's begin!"
    play_game(@player1, @player2)
  else
    pre_game()
  end
end

# GAME RUNNING
create_new_game()

get_player_names()

puts "----------".white

setup_decks()

puts "----------".white

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
