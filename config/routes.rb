Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'auth/github/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/:username', to: 'users#show'
end
