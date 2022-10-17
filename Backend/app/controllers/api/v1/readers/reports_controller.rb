module Api
  module V1
    module Readers
      class ReportsController < ReaderappController
        def createreports
          @report = Report.find_by(reader_id: current_reader.id, comment_id: params[:id])
          @comment = Comment.find(params[:id])
          @comment.update(content: @comment.content= "asdad")
          # if(@comment.reader_id == current_reader.id)
          #   render json: "You can't report your comment"
          # elsif @report
          #   render json: "You can report 1 time 1 comment"
          # else
            
          # end
          # render json: @comment.reader_id
          # render json: current_reader
        end
      end
    end
  end
end