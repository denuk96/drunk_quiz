# == Schema Information
#
# Table name: games
#
#  id            :bigint           not null, primary key
#  max_questions :integer          default(999)
#  min_questions :integer          default(0)
#  slug          :string
#  status        :integer          default("open")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  player_id     :bigint
#
# Indexes
#
#  index_games_on_player_id  (player_id)
#  index_games_on_slug       (slug)
#
class Game < ApplicationRecord
  belongs_to :owner, class_name: 'Player', foreign_key: 'player_id', optional: true
  has_many :players, dependent: :destroy
  has_many :questions, dependent: :destroy

  enum status: %i[open active closed]

  before_create :create_slug

  private

  def create_slug
    self.slug = rand.to_s[2..5]
  end
end
