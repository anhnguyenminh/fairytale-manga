module Api
  module V1
    module Readers
      class RecommendsController < ApplicationController
        def recommend_story
          @stories = Story.order("created_at DESC").limit(10)
          render json: @stories, each_serializer: nil
        end
      end
    end
  end
end
