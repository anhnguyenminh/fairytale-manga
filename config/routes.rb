Rails.application.routes.draw do
  devise_for :readers
  devise_for :admins
  namespace :api do
    namespace :v1 do
      namespace :admins do
        resources :admins
        resources :sessions
        resources :readers
        resources :gifts
        resources :stories
        resources :categories
      end

      namespace :readers do
        resources :readers
        resources :sessions
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
