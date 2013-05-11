Rails.application.routes.draw do
  post 'auth/sessions', to: 'sessions#create', as: :login
  delete 'auth/sessions', to: 'sessions#destroy', as: :logout
end
