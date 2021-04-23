class GamesController < ApplicationController
  def menu; end

  def new
    @player = Player.new
    @player.own_game.build
  end

  def create
    @player.create(strong_params)
  end

  private

  def strong_params
    params.require(:player).permit(
      :name,
      own_game_attributes: %i[min_questions max_questions]
    )
  end
end
