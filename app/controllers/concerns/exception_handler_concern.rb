module ExceptionHandlerConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::RoutingError, with: :on_routing_error
    rescue_from ActiveRecord::RecordNotFound, with: :on_record_not_found
    rescue_from CustomErrors::SessionAuthError, with: :on_session_auth_error
  end

  private

  def on_routing_error
    render_404
  end

  def on_record_not_found
    render_404
  end

  def on_session_auth_error
    redirect_to_new_player
  end

  def render_404
    render 'static/404', status: 404
  end

  def redirect_to_new_player
    slug = params[:game_slug] || params[:slug]
    redirect_to new_game_player_path(game_slug: slug)
  end
end
