module Api
  module V1
    module Readers
      class ReportsController < ReaderappController
        def createreports
          @comment = Comment.find(params[:id])
          if(@comment.reader_id == current_reader.id)
            render json: "You can't report your comment"
          else
            if @comment.report.blank?
              # @comment.report << Report.create(reader_id: @comment.reader_id, comment_id: @comment.id, num_report:1)
              # render json: @comment.report
              @report = Report.find(2)
              render json: @report.reader
            else
              @report = Report.find(2)
              render json: @report.reader
              # render json: @comment.report
            end
          end
          # render json: @comment.reader_id
          # render json: current_reader
        end
      end
    end
  end
end