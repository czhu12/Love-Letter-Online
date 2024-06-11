class Cards::Countess < Card
  has_text %{
    If you have this card and the King or Prince in your hand, you must discard this card.
  }
  has_value 7
  def execute_effect(player, game)
    # The Countess card effect is passive and enforced during play
    puts "#{player} has played the Countess and discarded it."
  end

  def enforce_rules(player, game)
    if player.hand.any? { |card| card.name == 'King' } || player.hand.any? { |card| card.name == 'Prince' }
      puts "#{player}, you must discard the Countess because you have the King or the Prince in your hand."
      player.hand.reject! { |card| card.name == 'Countess' }
      execute_effect(player)
      return true
    end
    false
  end
end
