class Cards::Prince < Card
  has_value 5
  has_text %{
    Choose any player, including yourself, to discard his or her hand and draw a new card.
  }
  def execute_effect(player, game)
    puts "#{player}, choose a player to discard their hand (you can choose yourself):"
    target_player_name = gets.chomp
    target_player = game.players.find { |p| p.to_s == target_player_name }

    if target_player.nil?
      puts "Player not found. Try again."
      return execute_effect(player, game)
    elsif target_player.protected
      puts "#{target_player} is protected by a Handmaid. Try again."
      return execute_effect(player, game)
    end

    discarded_card = target_player.hand.pop
    puts "#{target_player} discards #{discarded_card}."

    if discarded_card.name == 'Princess'
      puts "#{target_player} discarded the Princess and is eliminated."
      target_player.hand.clear
    else
      target_player.draw_card(game.deck)
      puts "#{target_player} draws a new card."
    end
  end
end
