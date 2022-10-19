module Api
  module V1
    module Admins
      class ChaptersController < AdminappController
        def create
          @chapter = Chapter.new(chapter_params)
          # # if params[:images].present?
          #   params[:images].each do |image|
          #     @message.images.attach(image)
          #   end
          # @chapter.images.attach(params[:images])
          # # end
          # if @chapter.save
          #   render json: {
          #     message: "success",
          #   }
          # else
          #   render json: {
          #     message: "failed",
          #     validation: @chapter.errors.messages,
          #   }, status: 400
          # end
          render json: chapter_params
          # binding.pry
          
        end

        def index
          chapters = Chapter.order(id: :desc).ransack(params[:q]).result
          @pagy, @chapters = pagy(chapters, items: 2)
          response_list(@chapters, { adapter: :json,
                                     each_serializer: nil })
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
            render json: {
                     message: "Failed",
                     validation: @chapter.errors.messages,
                   }, status: 400
          end
        end

        def destroy
          @chapter = Chapter.find(params[:id])
          if @chapter.destroy
            render json: {
              message: "destroy successfuly",
            }
          else
            render json: {
              message: "destroy failed",
            }, status: 400
          end
        end

        private

        def chapter_params
          params.permit(:name, :story_id, :images)
        end
      end
    end
  end
end
