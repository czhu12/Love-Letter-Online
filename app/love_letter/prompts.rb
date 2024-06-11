class Prompts
  attr_accessor :player
  def initialize(player)
    @player = player
  end

  def to_h
    { player: }
  end

  class ChoosePlayer < Prompts
    attr_accessor :players_to_choose

    def initialize(player, players_to_choose)
      super(player)
      @players_to_choose = players_to_choose
    end

    def to_h
      super.merge({players_to_choose: })
    end

    def to_s
      "#{player.name}, choose a player to compare hands with: #{player}"
    end
  end
end