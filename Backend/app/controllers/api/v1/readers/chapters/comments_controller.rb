module Api
  module V1
    module Readers
      class Chapters::CommentsController < CommentsController
          private 
          def set_commentable
            @commentable = Chapter.find(params[:id])
          end
      end
    end
  end
end