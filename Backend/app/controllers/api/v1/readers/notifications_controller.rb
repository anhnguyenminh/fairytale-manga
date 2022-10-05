module Api
  module V1
    module Readers
      class NotificationsController < ReaderappController
        def list_story
          time_range = (Time.now.midnight - 1.month)..Time.now.midnight
          @stories = current_reader.story.where('created_at'=> time_range)
                                         .where('end'=> nil)
          render json: {
            story_name: @stories
          }
        end
      end
    end
  end
end
