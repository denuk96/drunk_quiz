class GameChannel < ApplicationCable::Channel
  def subscribed
    p 'gamE CHANEL'
    p params
    stream_from("Game-#{params[:game_id]}") if params[:game_id].present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    p data
  end
end
