# frozen_string_literal: true

#
# select next question for rand player
class QuestionsManager
  attr_reader :game
  attr_accessor :questions, :current_player, :current_question

  def initialize(game)
    @game = game
    @questions = []
  end

  def next_question
    random_player
    collect_available_questions
    question_for_current_player
    output
  end

  private

  def random_player
    @current_player = @game.players.sample
  end

  def collect_available_questions
    self.questions = Question.available_questions(game.id)
  end

  def question_for_current_player
    question = questions.select do |q|
      q.player_id != current_player.id && (q.target_player_id.present? ? (q.target_player_id == current_player.id) : true)
    end.sample
    question&.closed!
    self.current_question = question
  end

  def output
    {
      player_name: current_player.name,
      question: current_question&.text,
    }
  end
end
