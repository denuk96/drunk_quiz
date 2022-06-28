module GamesHelper
  def target_questions_available?
    @game.active? && @game.target_questions_left(@player.id).positive?
  end
end
