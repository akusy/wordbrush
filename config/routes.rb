Rails.application.routes.draw do
  root :to => "users#new"

  get 'registrations/:activation_code' => 'registrations#new', as: 'new_registrations'
  resources :registrations, only: :create

  get '/sessions/:activation_code' => 'sessions#new', as: 'new_sessions'
  delete '/sessions' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: :create

  resources :users, only: [:new, :create]

end
