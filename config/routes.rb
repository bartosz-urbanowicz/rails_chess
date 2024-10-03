Rails.application.routes.draw do
  root "home#index"

  resources :games

  get "/games/:id/play", to: "games#play"
end
