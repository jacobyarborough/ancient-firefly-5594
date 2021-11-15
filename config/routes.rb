Rails.application.routes.draw do
  resources :teams, only: [:index]
  resources :competitions, only: [:show]
  resources :competition_teams, only: [:create]
end
