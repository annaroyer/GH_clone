Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'auth/github/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:index]
  get '/:username', to: 'users#show'
end
