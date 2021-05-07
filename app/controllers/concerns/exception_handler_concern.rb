module ExceptionHandlerConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::RoutingError, with: :on_routing_error
  end

  private

  def on_routing_error
    render_404
  end

  def render_404
    render 'static/404', status: 404
  end
end