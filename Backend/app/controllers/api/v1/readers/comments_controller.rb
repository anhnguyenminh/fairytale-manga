module Api
  module V1
    module Readers
      class CommentsController < ReaderappController
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
            render json: {
              message: "Something wrong. Please Check Again"
            }
          end
          #@comments = @commentable.comments
          if @comments
            render json: @comments
          end

          
        end

        def update
          @comment = Comment.find(params[:id])
          if @comment.reader_id == current_reader.id
            @comment.update(content: :content)
          else
            render json: {
              message: "You can't update this comment"
            }
          end
        end

        def destroy
          @comment = Comment.find(params[:id])
          if @comment.reader_id == current_reader.id
            @comment.destroy
          else
            render json: {
              message: "You can't delete this comment"
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