# == Schema Information
#
# Table name: games
#
#  id                   :bigint           not null, primary key
#  max_questions        :integer          default(3)
#  max_target_questions :integer          default(0)
#  min_questions        :integer          default(0)
#  slug                 :string
#  status               :integer          default("open")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  player_id            :bigint
#
# Indexes
#
#  index_games_on_player_id  (player_id)
#  index_games_on_slug       (slug)
#
class Game < ApplicationRecord
  SAFE_ATTRIBUTES = %i[min_questions max_questions max_target_questions].freeze

  belongs_to :owner, class_name: 'Player', foreign_key: 'player_id', optional: true
  has_many :players, dependent: :destroy
  has_many :questions, dependent: :destroy

  enum status: %i[open active closed]

  validates_presence_of *SAFE_ATTRIBUTES, :status

  before_create :create_slug

  def target_questions_left(player_id)
    max_target_questions - questions.where(player_id: player_id).where.not(target_player_id: nil).count
  end

  def players_hash
    players.map { |p| { id: p.id, name: p.name} }
  end

  def available_questions_count
    Question.available_questions(self.id).count
  end

  private

  def create_slug
    self.slug = rand.to_s[2..5]
  end
end
