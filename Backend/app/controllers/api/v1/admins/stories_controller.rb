module Api
  module V1
    module Admins
      class StoriesController < ApplicationController
        def create
          @story = Story.new(story_params)
          @story.image.attach(params[:image])
          if @story.save
            @categories = story_category_params
            @categories.each do |category|
              Category_story.create(story_id: @story.id, category_id: category)
            end
            # render json: @categories
            render json: {
              message: "success"
              # @categories
            }
          else
            render json: {
              message: "failed",
              validation: @story.errors.messages
            }, status: 400
          end
        end

        def index
          @stories = Story.all
          render json: @stories
        end

        def edit
          @story = Story.find(params[:id])
          render json: @story
        end
        
        def update
          @story = Story.find(params[:id])
            if @story.update(story_params)
              render json: "Update Successfully"
            else
              render json:{
                message: "Failed",
                validation: @story.errors.messages
              }, status: 400
            end
        end
        
        def destroy
          @story = Story.find(params[:id])
          if @story.destroy
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
          def story_params
            params.permit(:name, :author_id, :image)
          end

          def story_category_params 
            params.permit(categories: [])
          end
      end
    end
  end
end