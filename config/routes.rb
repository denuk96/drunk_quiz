Rails.application.routes.draw do
  root to: 'games#menu'
  get 'menu', to: 'games#menu', as: :menu
  # resources :games, only: %i[new create] do
  #
  # end
  scope 'games' do
    get 'new', to: 'games#new', as: :new_game
    post 'create_game', to: 'games#create', as: :create_game
  end
end
