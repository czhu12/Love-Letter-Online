class Cards::Handmaid < Card
  has_text %{
    Until your next turn, ignore all effects from other players.
  }
  has_value 4
  def execute_effect(player, game)
    player.protected = true
    puts "#{player} is now protected until their next turn."
  end
end
