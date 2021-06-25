Rails.application.routes.draw do
  root to: 'games#menu'

  get 'menu', to: 'games#menu', as: :menu

  resources :games, only: %i[new create show], param: :slug do
    resources :players, only: %i[new create]
    resources :questions, only: %i[new create]
    get '/questions' => redirect {|params, request| "games/#{params[:game_slug]}/questions/new" }, status: 301
  end
end
