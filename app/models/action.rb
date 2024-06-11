class Action < ApplicationRecord
  belongs_to :game
  validates :parameters, presence: true

end
