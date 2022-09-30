module Api
  module V1
    module Readers
      class StoriesController < ApplicationController
        def index
          @stories = Story.all.order("created_at DESC").limit(5)
          render json: @stories
        end
      end
    end
  end
end