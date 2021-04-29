class GameChannel < ApplicationCable::Channel
  attr_reader :game, :player, :channel_name

  def subscribed
    @player = Player.find params[:player_id]
    @game = Game.find params[:game_id]
    @channel_name = "Game-#{params[:game_id]}"
    stream_from(@channel_name)

    broadcast_question if @game.active?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start_game
    game.active!
    broadcast_question
  end
  #
  # def next_question
  #
  # end

  private

  def current_question
    Rails.cache.fetch("game: #{game}", expires_in: 1.hours) do
      QuestionsManager.new(game).next_question
    end
  end

  def broadcast_question
    GameChannel.broadcast_to(channel_name, current_question)
  end
end
