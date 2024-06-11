class Cards::Guard < Card
  has_text %{
    Name a non-Guard card and choose another player. If that player has that card, he or she is out of the round.
  }
  has_value 1

  def execute_effect(player, game)
    puts "#{player}, choose a player to guess their card: #{game.players.join(", ")}"
    target_player_name = gets.chomp
    target_player = game.players.find { |p| p.to_s == target_player_name }

    if target_player.nil?
      puts "Player not found. Try again."
      return execute_guard_effect(player)
    elsif target_player == player
      puts "You cannot choose yourself. Try again."
      return execute_guard_effect(player)
    elsif target_player.protected
      puts "#{target_player} is protected by a Handmaid. Try again."
      return execute_guard_effect(player)
    end

    puts "Guess the card of #{target_player} (excluding 'Guard'):"
    guessed_card_name = gets.chomp

    if guessed_card_name == 'Guard'
      puts "You cannot guess 'Guard'. Try again."
      return execute_guard_effect(player)
    end

    if target_player.hand.any? { |card| card.name == guessed_card_name }
      puts "Correct guess! #{target_player} had #{guessed_card_name}. #{target_player} is eliminated."
      game.eliminate_player(target_player)
    else
      puts "Incorrect guess. The game continues."
    end
  end
end
