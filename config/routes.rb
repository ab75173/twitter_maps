Rails.application.routes.draw do


  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root 'welcome#index'

  resources :events, only: [:index, :show]
  resources :users, only: [:show] do
    resources :events, only: [:index, :show]
    resources :favorites
  end
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'


  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end


end
