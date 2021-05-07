# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint           not null
#
# Indexes
#
#  index_players_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#
class Player < ApplicationRecord
  belongs_to :game
  has_many :own_games, class_name: 'Game', foreign_key: 'player_id', dependent: :destroy
  has_many :questions, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :game_id

  accepts_nested_attributes_for :own_games
end
