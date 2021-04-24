Rails.application.routes.draw do
  root to: 'games#menu'

  get 'menu', to: 'games#menu', as: :menu

  resources :games, only: %i[new create show], param: :slug do
    resources :questions, only: %i[new create]
  end
end
