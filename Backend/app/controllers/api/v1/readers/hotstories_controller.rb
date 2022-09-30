module Api
  module V1
    module Readers
      class HotstoriesController < ApplicationController
        def hot_day
          time_range = (Time.now.midnight - 1.week)..Time.now.midnight
          @stories = Story.joins(:category)
                          .select('categories.*, COUNT(stories.id) as book_count')
                          .group('categories.id')
                          .where('stories.created_at'=> time_range)
                          .order("book_count DESC")
          render json: @stories
        end
      end
    end
  end
end