module Api
  module V1
    module Readers
      class GiftsController < ApplicationController
        def index
          # gifts = Gift.order(id: :desc).ransack(params[:q]).result
          # @pagy, @gifts = pagy(gifts, items: 2)
          @gifts = Gift.all
          message ="asda"
          
          # binding.pry

          response_list(@gifts, { adapter: :json,
                                  each_serializer: GiftSerializer })
          # render ({json: @gifts, :adapter=>:json, :each_serializer=>GiftSerializer, :meta=>message})
          
          
        end

        def show
          @gift = Gift.find(params[:id])
          render json: @gift
        end

        
        # def exchange
          
        # end
        
      end
    end
  end
end