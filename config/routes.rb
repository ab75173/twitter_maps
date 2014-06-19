Rails.application.routes.draw do


  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root 'welcome#index'

  get '/events/search', to: 'events#search'

  resources :events, only: [:index, :show]
  resources :users, only: [:show] do
    resources :events, only: [:index, :show]
    resources :favorites
  end
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'



end
