class Cards::Priest < Card
  has_value 2
  has_text %{
    Look at another players hand.
  }
  def execute_effect(player, game)
    puts "#{player}, choose a player to look at their hand:"
    target_player_name = gets.chomp
    target_player = game.players.find { |p| p.to_s == target_player_name }

    if target_player.nil?
      puts "Player not found. Try again."
      return execute_priest_effect(player)
    elsif target_player == player
      puts "You cannot choose yourself. Try again."
      return execute_priest_effect(player)
    elsif target_player.protected
      puts "#{target_player} is protected by a Handmaid. Try again."
      return execute_priest_effect(player)
    end

    puts "#{player} looks at #{target_player}'s hand: #{target_player.hand.join(', ')}"
  end
end
