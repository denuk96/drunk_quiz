class QuestionsController < ApplicationController
  before_action :set_game, -> { find_player(params[:game_slug]) }

  def new
    if @player.questions.count < @game.max_questions
      @question = Question.new
    else
      raise 'redirect'
    end
    @game
  end

  def create

  end

  private

  def redirect_to_game(slug)

  end

  def set_game
    @game = Game.find_by(slug: params[:slug])
  end
end
