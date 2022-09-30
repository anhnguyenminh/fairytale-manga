module Api
  module V1
    module Readers
      class HotstoriesController < ApplicationController
        def hot_day
          a = 1
          @stories = Story.joins(:category)
                          .select('categories.*, COUNT(stories.id) as book_count')
                          .group('categories.id')
                          .where('stories.id'=> a)
                          .order("book_count DESC")
          render json: @stories
        end
      end
    end
  end
end