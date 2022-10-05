module Api
  module V1
    module Readers
      class Comments::CommentsController < CommentsController
        def index
          @stories = Story.find(params[:story_id])
          render json: @stories.comment
        end 
        
          private 
          def set_commentable
            @commentable = Comment.find(params[:id])
          end
      end
    end
  end
end