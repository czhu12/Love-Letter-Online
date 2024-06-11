class Card
  @value = nil
  @text = nil

  attr_accessor :game, :player
  def initialize(game, player)
    @game = game
    @player = player
  end

  def valid_action?
    true
  end

  def self.has_value(v)
    @value = v
  end

  def self.has_text(v)
    @text = v
  end

  def name
    self.class.name
  end

  def self.get_value
    @value
  end

  def self.get_text
    @text
  end

  def value
    self.class.instance_variable_get(:@value)
  end

  def text
    self.class.instance_variable_get(:@text)
  end

  def to_s
    "#{name} (#{value})"
  end

  def enforce_rules(player, game)
    false
  end
end
