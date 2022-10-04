Rails.application.routes.draw do
  devise_for :readers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :readers do
        resources :readers
        resources :sessions, only: [:create]
      #   resources :gifts, only: [:index]
      #   resources :authors, only: [:index]
        resources :reader_activations, only: [:edit]
        get '/header/', to: 'partials#header'
        get '/hotday/', to: 'hotstories#hot_day'
        get '/new/', to: 'histories#new'
        get '/recommend/', to: 'recommends#recommend_story'
        get '/read/', to: 'histories#read_story'
        resources :histories, only: [:show]
        resources :stories
        get '/list/', to: 'notifications#list'
        resources :comments, only: [:create, :index, :update, :destroy]

        resources :authors, shallow: true do
          resources :comments, only: [:create],  module: 'authors'
        end

        resources :chapters, shallow: true do
          resources :comments, only: [:create],  module: 'chapters'
        end

        resources :comments, shallow: true do
          resources :comments, only: [:create],  module: 'comments'
        end

        resources :stories, shallow: true do
          resources :comments, only: [:create],  module: 'stories'
        end
      end
      namespace :admins do
        resources :sessions, only:[:create]
        resources :admins
        resources :gifts
        resources :authors
        resources :categories
        resources :readers, only: [:index]
        resources :stories
        resources :chapters
      end
    end
  end

end
