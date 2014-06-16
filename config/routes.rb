Rails.application.routes.draw do


  devise_for :users, except: [:show], :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'welcome#index'
  resources :events, only: [:index, :show]
  resources :users, only: [:show] do
    resources :events, only: [:index, :show]
  end

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end


end
