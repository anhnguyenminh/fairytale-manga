module Api
  module V1
    module Readers
      class HistoriesController < ApplicationController
        before_action :set_commentable, only: [ :create]
        def create
          @comment = @commentable.comments.new(comment_params) do |c|
          c.readers = current_reader
          end
          render json: {
            message: "Create Successfuly"
          }
       end
      end
    end
  end
end