module GameProcessConcern
  extend ActiveSupport::Concern

  private

  def enough_questions?
    @player.questions.count >= @game.max_questions
  end

  def set_game(slug)
    @game = Game.find_by!(slug: slug)
  end
end