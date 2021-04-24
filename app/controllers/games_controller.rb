class GamesController < ApplicationController
  include GameProcessConcern
  before_action :set_game, -> { find_player(params[:slug]) }, only: :show

  def menu; end

  def new
    @player = Player.new
    @player.own_games.build
  end

  def create
    @player = Player.new(strong_params)
    @game = @player.own_games.last
    @game.save!
    @player.game_id = @game.id
    if @player.save
      save_player_to_session(@game.slug, @player.id)

      redirect_to new_game_question_path(game_slug: @game.slug)
    else
      render :new, notice: 'Smth went wrong'
    end
  end

  def show

  end

  private

  def strong_params
    params.require(:player).permit(
      :name,
      own_games_attributes: %i[min_questions max_questions]
    )
  end

  def set_game
    @game = Game.find_by(slug: params[:slug])
  end
end
