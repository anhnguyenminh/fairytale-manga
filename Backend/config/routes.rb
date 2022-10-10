Rails.application.routes.draw do
  devise_for :readers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :readers do
        #     Sign_up and Sign_in
        resources :readers
        resources :sessions, only: [:create]
        resources :reader_activations, only: [:edit]

        #     Get all categories for partials
        get "/header/", to: "partials#header"

        #     Search hot stories
        get "/hotday/", to: "hotstories#hot_day"
        get "/hotweek/", to: "hotstories#hot_week"
        get "/hotmonth/", to: "hotstories#hot_month"

        #     Show Stories And Read story
        resources :histories, only: [:show] #show stories
        post "/read_story/:id", to: "histories#read_story" #read stories
        get "/read_chapter/:name_story/:name_chapter/", to: "histories#showchapter" #show chap

        #     Notification
        get "/list/", to: "notifications#list_story"
        #     Recommend Story
        get "/recommend/", to: "recommends#recommend_story"
        get "/new/", to: "histories#new"
        get "/recommend/", to: "recommends#recommend_story"
        get "/read/", to: "histories#read_story"
        resources :histories, only: [:show]
        post "/read_story/:id", to: "histories#read_story"
        resources :stories

        resources :comments, only: [:create, :index, :update, :destroy]

        resources :authors, shallow: true do
          resources :comments, only: [:create, :index], module: "authors"
        end

        resources :chapters, shallow: true do
          resources :comments, only: [:create, :index], module: "chapters"
        end

        resources :comments, shallow: true do
          resources :comments, only: [:create, :index], module: "comments"
        end

        resources :stories, shallow: true do
          resources :comments, only: [:create, :index], module: "stories"
        end

        resources :likes, only: [:create, :index, :destroy]

        resources :authors, shallow: true do
          resources :likes, only: [:create, :index], module: "authors"
        end

        resources :comments, shallow: true do
          resources :likes, only: [:create, :index], module: "comments"
        end

        resources :stories, shallow: true do
          resources :likes, only: [:create, :index], module: "stories"
        end
      end
      namespace :admins do
        resources :sessions, only: [:create]
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
