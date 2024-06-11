class Deck
  def initialize
    @cards = [
      Cards::Guard.new, Cards::Guard.new, Cards::Guard.new, Cards::Guard.new, Cards::Guard.new,
      Cards::Priest.new, Cards::Priest.new,
      Cards::Baron.new, Cards::Baron.new,
      Cards::Handmaid.new, Cards::Handmaid.new,
      Cards::Prince.new, Cards::Prince.new,
      Cards::King.new,
      Cards::Countess.new,
      Cards::Princess.new
    ]
    shuffle_deck
  end

  def shuffle_deck
    @cards.shuffle!
  end

  def draw_card
    @cards.pop
  end

  def remaining_cards
    @cards.size
  end
end
