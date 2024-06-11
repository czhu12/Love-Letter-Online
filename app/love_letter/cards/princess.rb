class Cards::Princess < Card
  has_value 8
  has_text %{
    If you discard this card, you are out of the round.
  }
  def execute_effect(player, game)
    # The Princess card effect is that the player is eliminated if they discard it
    puts "#{player} has discarded the Princess and is eliminated from the game."
    game.eliminate_player(player)
  end
end
