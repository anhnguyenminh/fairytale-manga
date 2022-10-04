module Api
  module V1
    module Readers
      class LikesController < ApplicationController
        before_action :set_liketable, only: [ :create]
        def create
          @like = @liketable.comments.new do |c|
            c.readers = current_reader
          end
          render json: {
            message: "You 're liked that"
          }
        end

        def index
          if params[:author_id].present?
            @likes = Author.find(params[:author_id]).like.length
          elsif params[:chapter_id].present?
            @likes = Chapter.find(params[:chapter_id]).like.length
          elsif params[:comment_id].present?
            @likes = Comment.find(params[:comment_id]).like.length
          elsif params[:story_id].present?
            @likes = Story.find(params[:story_id]).like.length
          else
            @likes = nil
          end
          render json: @likes
        end

        def destroy
          @like = Like.find(params[:id])
          if @like.reader_id == current_reader.id
            @like.destroy
          else
            render json: {
              message: "You can't dislike "
            }
          end
        end

      end
    end
  end
end