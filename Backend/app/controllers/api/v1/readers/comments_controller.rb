module Api
  module V1
    module Readers
      class CommentsController < ReaderappController
        before_action :set_commentable, only: [:create, :index]

        def create
          if current_reader.time_ban == nil || current_reader.time_ban - Time.now >= 7.day
            current_reader.update(time_ban: nil)
            @comment = @commentable.comment.new(comment_params)
            @comment.reader = @current_reader
            if @comment.save
              render json: {
                message: "Save Successfuly",
              }
            else
              render json: {
                message: "Save Failed",
              }
            end
          else
            render json: "You can't comment because you 're banned"
          end
        end

        def index
          @comments = @commentable.comment
          render json: @comments
        end

        def update
          @comment = Comment.find(params[:id])
          if @comment.reader_id == current_reader.id
            @comment.update(comment_params)
            render json: {
              message: "ok",
            }
          else
            render json: {
              message: "You can't update this comment",
            }
          end
        end

        def destroy
          @comment = Comment.find(params[:id])
          if @comment.reader_id == current_reader.id
            @comment.destroy
          else
            render json: {
              message: "You can't delete this comment",
            }
          end
        end

        private

        def comment_params
          params.permit(:content)
        end
      end
    end
  end
end
