module Api
  module V1
    module Admins
      class ChaptersController < ApplicationController
        def create
          @chapter = Chapter.new(chapter_params)
          @story.images.attach(params[:images])
          if @chapter.save
            render json: {
              message: 'success'
            }
          else
            render json:{
              message: 'failed',
              validation: @chapter.errors.messages
            }, status: 400
          end
        end

        def index
          @q = Chapter.ransack(params[:q])
          @chaps = @q.result(distinct: true)
          @chapters = @chaps.where('story_id'=> params[:id])
          render json: @chapters
        end

        def edit
          @chapter = Chapter.find(params[:id])
          render json: @chapter
        end
        
        def update
          @chapter = Chapter.find(params[:id])
            if @chapter.update(chapter_params)
              render json: "Update Successfully"
            else
              render json:{
                message: "Failed",
                validation: @chapter.errors.messages
              }, status: 400
            end
        end
        
        def destroy
          @chapter = Chapter.find(params[:id])
          if @chapter.destroy
            render json: {
              message: "destroy successfuly"
            }
          else
            render json: {
              message: "destroy failed"
            }, status: 400
          end
        end

        private
          def chapter_params
            params.permit(:name, :story_id, images: [])
          end
      end
    end
  end
end