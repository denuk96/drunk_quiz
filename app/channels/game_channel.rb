class GameChannel < ApplicationCable::Channel
  attr_reader :game, :player, :channel_name

  # called on subscribing, work's as initialize for GameChannel instance
  def subscribed
    @player = Player.find params[:player_id]
    @game = Game.find params[:game_id]
    @channel_name = "Game-#{params[:game_id]}"

    stream_from(@channel_name)

    broadcast_question if @game.active?
  end

  # called on disconnecting
  def unsubscribed; end

  # custom public method
  def start_game
    game.active!
    broadcast_game_started
  end

  # custom public method
  def next_question
    Rails.cache.delete(channel_name)
    broadcast_question
  end

  private

  def current_question
    Rails.cache.fetch(channel_name, expires_in: 1.hours) do
      QuestionsManager.new(game).next_question
    end
  end

  def broadcast_game_started
    broadcast(:game_state, :started)
  end

  def broadcast_question
    broadcast(:question, current_question)
  end

  def broadcast(type, message)
    data = { type: type, message: message, players: all_players_hash }
    # broadcasting data to each subscriber
    ActionCable.server.broadcast(channel_name, data)
  end

  def all_players_hash
    game.players.map { |p| { id: p.id, name: p.name} }
  end
end
