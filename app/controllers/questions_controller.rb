class QuestionsController < ApplicationController
  include GameProcessConcern
  include GamesHelper
  before_action -> { set_game(params[:game_slug]) }, -> { find_player(params[:game_slug]) }

  def new
    redirect_to game_path(@game.slug) if max_questions?

    count_questions
    @question = Question.new
    @can_skip = enough_questions?
  end

  def create
    @question = @game.questions.build(question_params.merge(player_id: @player.id))

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

  def create_target_question
    redirect_to game_path(slug: @game.slug) and return unless target_questions_available?

    question = @game.questions.build(target_question_params.merge(player_id: @player.id))
    flash[:errors] = question.errors.full_messages.to_sentence unless question.save

    redirect_to game_path(slug: @game.slug)
  end

  private

  def count_questions
    @questions_done = @player.questions.count
    @questions_left = @game.max_questions
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def target_question_params
    params.permit(:text, :target_player_id)
  end
end
