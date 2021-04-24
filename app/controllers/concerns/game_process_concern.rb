module GameProcessConcern
  extend ActiveSupport::Concern

  private

  def enough_questions?
    @player.questions.count >= @game.max_questions
  end
end