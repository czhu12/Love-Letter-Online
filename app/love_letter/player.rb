class Player
  attr_accessor :id, :name, :metadata

  def initialize(id, name, metadata: {
      hand: [],
      protected: false
  })
    @id = id
    @name = name
    @metadata = metadata
  end

  def metadata
    @metadata.with_indifferent_access
  end

  def draw_card(deck)
    metadata[:hand] << deck.draw_card
  end

  def play_card(index)
    @hand.delete_at(index)
  end

  def to_s
    @name
  end
end
