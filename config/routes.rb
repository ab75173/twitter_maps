Rails.application.routes.draw do


  devise_for :users
  root 'welcome#index'
  resources :events, only: [:index, :show]
  resources :users, only: [:show] do
    resources :events, only: [:index, :show]
  end


end
