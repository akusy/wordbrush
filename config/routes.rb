Rails.application.routes.draw do

  get 'registrations/:activation_code' => 'registrations#new', as: 'new_registrations'
  resources :registrations, only: :create

  get '/sessions/:activation_code' => 'sessions#new', as: 'new_sessions'
  delete '/sessions' => 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create]
end
