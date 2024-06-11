class Cards::King < Card
  has_value 6
  has_text %{
    Trade hands with another player of your choice.
  }
  def execute_effect(player, game)
    puts "#{player}, choose a player to trade hands with:"
    target_player_name = gets.chomp
    target_player = game.players.find { |p| p.to_s == target_player_name }

    if target_player.nil?
      puts "Player not found. Try again."
      return execute_effect(player, game)
    elsif target_player == player
      puts "You cannot choose yourself. Try again."
      return execute_effect(player, game)
    elsif target_player.protected
      puts "#{target_player} is protected by a Handmaid. Try again."
      return execute_effect(player, game)
    end

    player_hand = player.hand.dup
    target_player_hand = target_player.hand.dup

    player.hand = target_player_hand
    target_player.hand = player_hand

    puts "#{player} trades hands with #{target_player}."
  end
end
