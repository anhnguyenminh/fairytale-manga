Rails.application.routes.draw do
  devise_for :readers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # namespace :readers do
      #   resources :readers
      #   resources :sessions, only: [:create]
      #   resources :gifts, only: [:index]
      #   resources :authors, only: [:index]
      #   resources :account_activations, only: [:edit]
      # end
      namespace :admins do
        resources :sessions, only:[:create]
        resources :admins
        resources :gifts
        resources :authors
        resources :categories
        resources :readers, only: [:index]
        # resources :chapters
        # resources :comments
      end
    end
  end

end
