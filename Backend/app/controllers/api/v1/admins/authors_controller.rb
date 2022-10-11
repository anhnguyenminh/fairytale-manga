module Api
  module V1
    module Admins
      class AuthorsController < AdminappController
        def get_authors
          @authors = Author.all
          render json: @authors
        end

        def create
          @author = Author.new(author_params)
          @author.image.attach(params[:author][:image])
          if @author.save
            render json: {
              message: "Success",
            }
          else
            render json: {
              message: "Failded",
              validation: @author.errors.messages,
            }, status: 400
          end
        end

        def index
          authors = Author.order(id: :desc).ransack(params[:q]).result
          @pagy, @authors = pagy(authors, items: 2)
          response_list(@authors, { adapter: :json,
                                    each_serializer: ReaderSerializer })
        end

        def show
          @author = Author.find(params[:id])
          render json: @author
        end

        def update
          @author = Author.find(params[:id])
          if @author.update(author_params)
            render json: "Update Successfully"
          else
            render json: {
                     message: "Failed",
                     validation: @author.errors.messages,
                   }, status: 400
          end
        end

        def destroy
          @author = Author.find(params[:id])
          # render json: @author.story
          if @author.story.length == 0
            @author.destroy
            render json: {
              message: "destroy successfuly",
            }
          else
            render json: {
              message: "destroy failed because author has many story",
            }, status: 400
          end
        end

        private

        def author_params
          params.permit(:name, :description, :image)
        end
      end
    end
  end
end
