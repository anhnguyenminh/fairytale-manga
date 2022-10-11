module Api
  module V1
    module Admins
      class GiftsController < AdminappController
        def create
          @gift = Gift.new(gift_params)
          @gift.image.attach(params[:gift][:image])
          if @gift.save
            render json: {
              message: "success",
            }
          else
            render json: {
              message: "failed",
              validation: @gift.errors.messages,
            }, status: 400
          end
        end

        def index
          gifts = Gift.order(id: :desc).ransack(params[:q]).result
          @pagy, @gifts = pagy(gifts, items: 2)
          response_list(@gifts, { adapter: :json,
                                    each_serializer: ReaderSerializer })
        end

        def show
          @gift = Gift.find(params[:id])
          render json: @gift
        end

        def update
          @gift = Gift.find(params[:id])
          if @gift.update(gift_params)
            render json: "Update Successfully"
          else
            render json: {
                     message: "Failed",
                     validation: @gift.errors.messages,
                   }, status: 400
          end
        end

        def destroy
          @gift = Gift.find(params[:id])
          if @gift.destroy
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

        def gift_params
          params.permit(:name, :score, :stock, :image)
        end
      end
    end
  end
end
