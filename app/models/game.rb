class Game < ApplicationRecord
  before_create :generate_unique_code

  enum status: {
    lobby: 0,
    playing: 1,
    completed: 2,
  }

  def add_player(name, metadata: {})
    player = Player.new(Random.uuid, name, metadata)
    players = (initial_state['players'] || []) << player.to_h
    update(initial_state: initial_state.merge('players' => players))
  end

  def remove_player(id)
    players = (initial_state['players'] || []).reject { |player| player[:id] == id }
    update(initial_state: initial_state.merge('players' => players))
  end

  private

  def generate_unique_code
    self.code = loop do
      random_code = SecureRandom.hex(3).upcase # Generates a 6-character hex string
      break random_code unless Game.exists?(code: random_code)
    end
  end
end
