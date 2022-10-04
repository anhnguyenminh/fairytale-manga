module Api
  module V1
    module Readers
      class show_categories::CommentsController < CommentsController
          private 
          def set_commentable
            @commentable = Story.find(params[:id])
          end
      end
    end
  end
end