module GamesHelper
  def target_questions_available?
    @game.target_questions_left(@player.id) > 0
  end
end
