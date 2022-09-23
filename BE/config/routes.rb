Rails.application.routes.draw do
  # devise_for :users
  namespace :v1 do
    resources :accounts, only: [:create, :update] do
      resources :contacts , only: [:index]
    end
    resources :sessions, only: [:create, :destroy]
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
