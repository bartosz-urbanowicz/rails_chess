Rails.application.routes.draw do
  root "home#index"

  resources :games

  get "/games/:id/play", to: "games#play"
  get "/games/:id/possible_moves", to: "games#possible_moves", as: "possible_moves_game"
end
