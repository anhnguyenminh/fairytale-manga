module Api
  module V1
    module Readers
      class ReportsController < ApplicationController
        def create
          @comment = Comment.find(params[:id])
          if(@comment.reader_id == current_reader.id)
            render json: "You can't report your comment"
          else
            render @comment.report
          end
        end
      end
    end
  end
end