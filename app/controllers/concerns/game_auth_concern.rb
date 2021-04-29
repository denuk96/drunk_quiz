module GameAuthConcern
  extend ActiveSupport::Concern

  private

  def save_player_to_session(game_slug, player_id)
    store = session[:store] || {}
    store.merge!("#{game_slug}": player_id)
    session[:store] = store
  end

  def find_player(game_slug)
    id = session[:store][game_slug.to_s]
    @player = Player.find id
  end
end