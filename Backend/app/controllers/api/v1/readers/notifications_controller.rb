module Api
  module V1
    module Readers
      class NotificationsController < ReaderappController
        def list_story
          time_range = (Time.now.midnight - 1.month)..Time.now.midnight
          @stories = current_reader.story.where('created_at'=> time_range)
          render json: @stories
        end
      end
    end
  end
end
