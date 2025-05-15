Rails.application.routes.draw do
  devise_for :users
  root "games#index"

  resources :games do
    resources :game_moves, only: [:create]
  end


  get "/games/:id/play", to: "games#play", as: "play_game"
end
