# select next question for rand player
class QuestionsManager
  attr_reader :game
  attr_accessor :questions, :current_player, :current_question

  def initialize(game)
    @game = game
    @questions = []
    random_player
  end

  def next_question
    collect_available_questions
    question_for_current_player
    serialize_output
  end

  private

  def random_player
    @current_player = @game.players.sample
  end

  def collect_available_questions
    self.questions = Question.available_questions(game.id)
  end

  def question_for_current_player
    question = questions.reject { |q| q.player_id == current_player.id }.sample
    question&.closed!
    random_player
    question
  end

  def serialize_output
    {
      player_name: current_player.name,
      question: current_question&.body,
      questions_left: questions.size
    }
  end
end