class QuestionsController < ApplicationController
  include GameProcessConcern
  before_action -> { set_game(params[:game_slug]) }, -> { find_player(params[:game_slug]) }

  def new
    redirect_to game_path(@game.slug) if enough_questions?

    @questions_done = @player.questions.count
    @questions_left = @game.max_questions
    @question = Question.new
  end

  def create
    question = @game.questions.build(strong_params)
    question.player = @player

    if question.save && enough_questions?
      redirect_to games_path(@game.slug)
    else
      redirect_to new_game_question_path(game_slug: @game.slug)
    end
  end

  private

  def strong_params
    params.require(:question).permit(:text)
  end
end
