module Api
  module V1
    module Admins
      class StoriesController < AdminappController
        def new
          @categories = Category.all
          @authors = Author.all
          render json: {
            categories: @categories,
            author: @authors
          }
        end
        
        def create
          @story = Story.new(story_params)
          @story.image.attach(params[:image])
          if @story.save
            @categories = params[:categories]
            @categories.each do |c|
              @category = Category.find(c)
              @story.category << Category.find(c)
            end
            render json: {
              message: "Success",
            }
          else
            render json: {
              message: "failed",
              validation: @story.errors.messages,
            }, status: 400
          end
        end

        def index
          @stories = Story.paginate(page: params[:page], per_page: 10)
          render json: @stories
        end

        def show
          @story = Story.find(params[:id])
          render json: @story
        end

        def update
          @story = Story.find(params[:id])
          if @story.update(story_params)
            render json: "Update Successfully"
          else
            render json: {
                     message: "Failed",
                     validation: @story.errors.messages,
                   }, status: 400
          end
        end

        def destroy
          @story = Story.find(params[:id])
          if @story.chapter.destroy_all && @story.category.destroy_all
            @story.destroy
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

        def story_params
          params.permit(:name, :author_id, :image)
        end
      end
    end
  end
end
