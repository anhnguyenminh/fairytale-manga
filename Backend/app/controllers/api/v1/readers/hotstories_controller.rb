module Api
  module V1
    module Readers
      class HotstoriesController < ApplicationController
        def hot_day
          time_range = (Time.now.midnight - 1.day)..Time.now.midnight
          @stories = Story.hot_story(time_range)
          render json: @stories , each_serializer: nil
        end

        def hot_month
          time_range = (Time.now.midnight - 1.month)..Time.now.midnight
          @stories = Story.hot_story(time_range)
          render json: @stories , each_serializer: nil
        end

        def hot_week
          time_range = (Time.now.midnight - 1.week)..Time.now.midnight
          @stories = Story.hot_story(time_range)
          render json: @stories , each_serializer: nil
        end
      end
    end
  end
end