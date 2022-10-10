module Api
  module V1
    module Readers
      class StoriesController < ApplicationController
        before_action :authenticate_request_reader

        def index
          @stories = Story.all.order("created_at DESC").limit(5)
          render json: @stories
        end

        def search_stories
          @q = Story.ransack(params[:q])
          @stories = @q.result(distinct: true)
          render json: @stories
        end
      end
    end
  end
end
