module Api
  module V1
    module Admins
      class StoriesController < AdminappController
        def get_authors
          @authors = Author.all
          render json: @authors
        end

        def get_categories
          @categories = Category.all
          render json: @categories
        end

        def create
          @story = Story.new(story_params)
          @story.image.attach(params[:image])
          if @story.save
            @ca = JSON.parse params[:categories_id]
            @ca.each do |c|
              @category = Category.find(c)
              @story.category << @category
            end
            render json: {
              message: "Success",
            }
            # render json: @ca
          else
            render json: {
              message: "failed",
              validation: @story.errors.messages,
            }, status: 400
          end
          
          # binding.pry
          
        end

        def index
          stories = Story.order(id: :desc).ransack(params[:q]).result
          @pagy, @stories = pagy(stories, items: 2)
          response_list(@stories, { adapter: :json,
                                    each_serializer: StorySerializer })
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
          params.permit(:name, :author_id, :description, :end, :image, categories_id: [])
        end

        # def test_params
        #   params.permit(:categories_id)
        # end
      end
    end
  end
end
