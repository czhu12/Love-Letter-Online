class LoveLetter
  attr_accessor :players
  def initialize(players)
    @players = players
    @deck = Deck.new
    @current_player_index = 0

    # Each player draws one card to start
    @players.each { |player| player.draw_card(@deck) }
  end

  def next_player
    @current_player_index = (@current_player_index + 1) % @players.size
  end

  def current_player
    @players[@current_player_index]
  end

  def start
    until @deck.remaining_cards.zero? || @players.one? { |player| !player.hand.empty? }
      player_turn(current_player)
      next_player
    end
    determine_winner
  end

  def player_turn(player)
    player.draw_card(@deck)
    puts "#{player}'s turn. Hand: #{player.hand.join(', ')}"
    player.hand.each do |card|
      card.enforce_rules(player, self)
    end
    
    if player.hand.size == 2
      puts "Choose a card to play (0 or 1):"
      index = gets.chomp.to_i
      played_card = player.play_card(index)
      played_card.execute_effect(player, self)

      puts "#{player} played #{played_card}"
    end
  end

  def determine_winner
    remaining_players = @players.select { |player| !player.hand.empty? }
    winner = remaining_players.max_by { |player| player.hand.first.value }
    puts "The winner is #{winner} with the #{winner.hand.first}!"
  end

  def eliminate_player(player)
    @players.delete(player)
    puts "#{player} has been removed from the game."
  end
end
