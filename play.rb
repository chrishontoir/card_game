require_relative('card.rb')
require_relative('deck.rb')
require_relative('player.rb')
require('colorize')

def create_new_game
  @player1 = Player.new("", 30, 1, [], "", [], [])
  @player2 = Player.new("", 30, 1, [], "", [], [])

  @game_active = true

  @damage = 0

  @total_cards = 20

  @default_deck_1 = Deck.new("Default", [])
  @default_deck_2 = Deck.new("Default", [])

  @lightning_bolt = Card.new("Lightning Bolt", 4, 0, 3)
  @wounding_strike = Card.new("Wounding Strike", 5, 0, 4)
  @crushing_blow = Card.new("Crushing Blow", 6, 0, 5)
  @dynamite = Card.new("Dynamite", 7, 0, 6)
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
  @default_deck_1.add_card_to_deck(@dynamite)
  @default_deck_1.add_card_to_deck(@bandage)
  @default_deck_1.add_card_to_deck(@health_potion)
  @default_deck_1.add_card_to_deck(@greater_health_potion)

  @default_deck_2.add_card_to_deck(@bite)
  @default_deck_2.add_card_to_deck(@glancing_hit)
  @default_deck_2.add_card_to_deck(@snowball)
  @default_deck_2.add_card_to_deck(@lightning_bolt)
  @default_deck_2.add_card_to_deck(@wounding_strike)
  @default_deck_2.add_card_to_deck(@crushing_blow)
  @default_deck_2.add_card_to_deck(@dynamite)
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

  if @player1.player_name == @player2.player_name
    @player1.player_name = @player1.player_name + " 1"
    @player2.player_name = @player2.player_name + " 2"
  end

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
  puts @dynamite.card_details
  puts "----------".white
  puts @bandage.card_details
  puts @health_potion.card_details
  puts @greater_health_potion.card_details
end

# def add_card_to_new_deck(card_name, new_card)
#   if new_card == card_name.name
#     player.player_decks[-1].card_array.push(card_name)
#     counter += 1
#     puts "Added: #{card_name.name} (#{counter}/5)"
#   end
# end

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
    elsif new_card == "dynamite"
      player.player_decks[-1].card_array.push(@dynamite)
      counter += 1
      puts "Added: #{@dynamite.name} (#{counter}/10)"
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

  for deck in player.player_decks
    all_decks.push(deck.name.upcase)
  end
  p all_decks
  player_deck_choice = gets.chomp
  if all_decks.include?(player_deck_choice.upcase)
    player.player_chosen_deck = player_deck_choice
    puts "#{player.player_chosen_deck.upcase} deck selected."
    puts "----------".white
  else
    puts "Deck name not recognised."
    player_choose_deck(player)
  end
end

def play_card(player)
  if player.player_played.length == 0
    puts "You cannot play any more cards."
  else
    puts "Enter the position of the card you want to play."
    player_position = gets.chomp
    # player1_position -= 1
    if player_position == "" || player_position == "pass"
      puts "You are about to skip your turn."
      puts "Continue? (y/n)"
      skip_turn = gets.chomp
      if skip_turn == "n"
        play_card(player)
      elsif skip_turn == "y"
        puts "Your turn was skipped."
      else
        puts "Input not recognised."
      end
    elsif player_position.to_i > player.player_played.length
      puts "Not a valid input."
      play_card(player)
    else
      if player.player_played[(player_position.to_i) - 1].cost <= player.player_power
        puts player.player_played[(player_position.to_i) -1].card_details

        puts "Continue? (y/n):"
        player_continue = gets.chomp
        if player_continue == "n"
          play_card(player)
        elsif player_continue != "y" && player_continue != "n"
          puts "Invalid input."
        else
          @damage = player.player_played[(player_position.to_i) -1].damage
          player.player_health += player.player_played[(player_position.to_i) -1].healing
          player.player_played.delete_at((player_position.to_i) - 1)

          @total_cards -= 1
        end


      else
        puts "Not enough power to play that card."
        play_card(player)
      end
    end
  end
end

def player_turn(player)
  for card in player.player_playing_deck[0].card_array
    if player.player_played.length < 5
      player.player_played << card
      player.player_playing_deck[0].card_array.shift
    end
  end
  # if player.player_played.length > 0
  if @total_cards > 0
    player.player_health -= @damage
    puts "------------------------------"
    puts "-----------WELCOME!-----------"
    puts "------------------------------"
    puts "PLAYER: #{player.player_name}"
    puts "HEALTH: #{player.player_health}, POWER: #{player.player_power}"
    puts "----------".white
    for card in player.player_played
      puts card.card_details
    end

    puts "----------".white
    play_card(player)

    puts "----------".white
    # puts "Continue? (y/n):"
    # player_continue = gets.chomp
    # if player_continue == "n"
    #   play_card(player)
    # elsif player_continue != "y" && player_continue != "n"
    #   puts "Invalid input."
    # end
    system "clear"

    if player.player_power < 6
      player.player_gain_power(1)
    end
  else
    @game_active = false
    end_game(@player1, @player2)
  end
end

def play_game(player1, player2)
  for deck in player1.player_decks
    if deck.name.upcase == player1.player_chosen_deck.upcase
      player1.player_playing_deck << deck
      player1.player_playing_deck[0].card_array.shuffle!
    end
  end
  for deck in player2.player_decks
    if deck.name.upcase == player2.player_chosen_deck.upcase
      player2.player_playing_deck << deck
      player2.player_playing_deck[0].card_array.shuffle!
    end
  end
  while @game_active == true
    player_turn(player1)
    break if @game_active == false
    player_turn(player2)
  end
end

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
