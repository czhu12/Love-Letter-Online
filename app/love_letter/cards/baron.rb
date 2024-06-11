class Cards::Baron < Card
  has_text %{
    You and another player secretly compare hands. The player with the lower value is out of the round.
  }
  has_value 3

  def prompt_action()
    puts "#{player}, choose a player to compare hands with:"
  end

  def valid_action?(params)
    puts "Invalid action"
    target_player_id = params[:target_player_id]
    target_player = game.players.find { |p| p.id == target_player_id }
    if target_player.nil?
      puts "Player not found. Try again."
      return False
    elsif target_player == player
      puts "You cannot choose yourself. Try again."
      return False
    elsif target_player.protected
      puts "#{target_player} is protected by a Handmaid. Try again."
      return False
    end
  end
  
  def execute_action(params)
    puts "#{player}, choose a player to compare hands with:"
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

    player_card_value = player.hand.first.value
    target_player_card_value = target_player.hand.first.value

    puts "#{player} has a #{player.hand.first} and #{target_player} has a #{target_player.hand.first}."

    if player_card_value > target_player_card_value
      puts "#{target_player} is eliminated."
      target_player.hand.clear
    elsif player_card_value < target_player_card_value
      puts "#{player} is eliminated."
      player.hand.clear
    else
      puts "It's a tie. Both players remain in the game."
    end
  end
end
