module Api
  module V1
    module Admins
      class CommentsController < ApplicationController
        def index
          comment = Comment.where("num_report >= ? and status = 0", 3).order(id: :desc).ransack(params[:q]).result
          @pagy, @comment = pagy(comment, items: 2)
          response_list(@comment, { adapter: :json,
                                       each_serializer: nil })
        end

        def ban_comment
          @comment = Comment.find(params[:id])
          # @comment.update(status: params[:status])
          if params[:status] == 1 #banned
            @reader = Reader.find(@comment.reader_id)
            @comment.update(status: params[:status])
            @title = "Warning your comment is toxic."
            @notification = Notification.create(reader_id: @comment.reader_id, title: @title)
            if @reader.update(ban: 1 + @reader.ban)
              render json: "dr"
            else 
              render json: "chua dc"
            end
          elsif params[:status] == 2
            render json: "ok"
          else
            render json: {
              message: "Not have status"
            }, status: 400
          end
        end
      end
    end
  end
end