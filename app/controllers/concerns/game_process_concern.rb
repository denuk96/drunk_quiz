module GameProcessConcern
  extend ActiveSupport::Concern

  private

  def max_questions?
    @player.questions.count >= @game.max_questions
  end

  def set_game(slug)
    @game = Game.find_by!(slug: slug)
  end

  def enough_questions?
    @player.questions.count >= @game.min_questions
  end

  def can_join?
    enough_questions? || max_questions?
  end
end
