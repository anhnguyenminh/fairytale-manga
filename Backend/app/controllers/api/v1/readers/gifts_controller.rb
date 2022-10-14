module Api
  module V1
    module Readers
      class GiftsController < ReaderappController
        def index
          # gifts = Gift.order(id: :desc).ransack(params[:q]).result
          # @pagy, @gifts = pagy(gifts, items: 2)
          @gifts = Gift.all
          message = "asda"
          current_reader = @current_reader
          # binding.pry

          # response_list(@gifts, { adapter: :json,
          #                         each_serializer: GiftSerializer })
          render ({ json: @gifts, adapter: :json, each_serializer: GiftSerializer, current_reader: @current_reader.id })
          #  render json: current_reader

        end

        def show
          @gift = Gift.find(params[:id])
          render json: @gift, :each_serializer => GiftSerializer
        end

        # def exchange

        # end

      end
    end
  end
end
