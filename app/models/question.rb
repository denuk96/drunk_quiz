# == Schema Information
#
# Table name: questions
#
#  id               :bigint           not null, primary key
#  status           :integer          default("open")
#  text             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  game_id          :bigint           not null
#  player_id        :bigint           not null
#  target_player_id :integer
#
# Indexes
#
#  index_questions_on_game_id    (game_id)
#  index_questions_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (player_id => players.id)
#
class Question < ApplicationRecord
  enum status: %i[open closed]

  belongs_to :player
  belongs_to :game

  validates :text, presence: true, length: { minimum: 10 }

  scope :available_questions, ->(game_id) { where(game_id: game_id, status: :open) }
end
