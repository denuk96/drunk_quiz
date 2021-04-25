class PlayersController < ApplicationController
  include GameProcessConcern
  before_action -> { set_game(params[:game_slug]) }

  def new
    @player = @game.players.build
  end

  def create
    if @game.players.create(strong_params)
      redirect_to new_game_question_path(game_slug: @game.slug)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:player).permit(:name)
  end
end
