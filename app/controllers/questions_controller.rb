class QuestionsController < ApplicationController
  include GameProcessConcern
  before_action -> { set_game(params[:game_slug]) }, -> { find_player(params[:game_slug]) }

  def new
    redirect_to game_path(@game.slug) if max_questions?

    count_questions
    @question = Question.new
    @can_skip = enough_questions?
  end

  def create
    @question = @game.questions.build(strong_params)
    @question.player = @player

    if @question.save && max_questions?
      redirect_to game_path(slug: @game.slug)
    elsif @question.errors.any?
      count_questions
      @can_skip = enough_questions?

      render :new
    else
      redirect_to new_game_question_path(game_slug: @game.slug)
    end
  end

  private

  def count_questions
    @questions_done = @player.questions.count
    @questions_left = @game.max_questions
  end

  def strong_params
    params.require(:question).permit(:text)
  end
end
