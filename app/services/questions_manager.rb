# select next question for rand player
class QuestionsManager
  attr_reader :game
  attr_accessor :questions, :current_player

  def initialize(game)
    @game = game
    @questions = []
    random_player
  end

  def next_question
    collect_available_questions
    question_for_current_player
  end

  private

  def random_player
    @current_player = @game.players.sample
  end

  def collect_available_questions
    self.questions = Question.available_player_questions(game.id, current_player.id)
  end

  def question_for_current_player
    question = questions.sample
    question&.closed!
    random_player
    question
  end
end