Rails.application.routes.draw do

  root 'welcome#index'
  resources :events, only: [:index, :show]
  resources :users, only [:show] do
    resources :events, only [:index, :show]
  end


end
