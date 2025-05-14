Rails.application.routes.draw do
  devise_for :users
  root "games#index"

  resources :games

  get "/games/:id/play", to: "games#play", as: "play_game"
  get "/games/:id/possible_moves", to: "games#possible_moves", as: "possible_moves_game"
end
