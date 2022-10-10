module Api
  module V1
    module Admins
      class CategoriesController < AdminappController
        def get_categories
          @categories = Category.all
          render json: @categories         
        end

        def create
          @category = Category.new(category_params)
          if @category.save
            render json: {
              message: "success",
            }
          else
            render json: {
              message: "failed",
              validation: @category.errors.messages,
            }, status: 400
          end
        end

        def index
          @categories = Category.paginate(page: params[:page], per_page: 10)
          #Ex:- :limit => 40
          render json: @categories
          # show_categories
        end

        def edit
          @category = Category.find(params[:id])
          render json: @category
        end

        def show
          @category = Category.find(params[:id])
          render json: @category
        end

        def update
          @category = Category.find(params[:id])
          if @category.update(category_params)
            render json: "Update Successfully"
          else
            render json: {
                     message: "Failed",
                     validation: @category.errors.messages,
                   }, status: 400
          end
        end

        def destroy
          @category = Category.find(params[:id])
          if @category.story.destroy_all
            @category.destroy
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

        def category_params
          params.permit(:name, :description)
        end
      end
    end
  end
end
