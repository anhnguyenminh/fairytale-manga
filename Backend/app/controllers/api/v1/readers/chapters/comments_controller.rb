module Api
  module V1
    module Readers
      class Chapters::CommentsController < CommentsController
        private

        def set_commentable
          @commentable = Chapter.joins(:story).merge(Story.published).find(params[:chapter_id])
        end
      end
    end
  end
end
