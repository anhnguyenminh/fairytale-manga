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

        def index
          if params[:author_id].present?
            @comments = Author.find(params[:author_id]).comment
          elsif params[:chapter_id].present?
            @comments = Chapter.find(params[:chapter_id]).comment
          elsif params[:comment_id].present?
            @comments = Comment.find(params[:comment_id]).comment
          elsif params[:story_id].present?
            @comments = Story.find(params[:story_id]).comment
          else
            @comments = nil
          end
          render json: {
            message: "Something wrong. Please Check Again"
          }
        end
      end
    end
  end
end