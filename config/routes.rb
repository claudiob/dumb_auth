Rails.application.routes.draw do
  post 'auth/sessions', to: 'sessions#create', as: :login
  delete 'auth/sessions', to: 'sessions#destroy', as: :logout
  get 'auth/:provider/callback', to: "sessions#show"
  post 'auth/:provider/callback', to: "sessions#show"
end
