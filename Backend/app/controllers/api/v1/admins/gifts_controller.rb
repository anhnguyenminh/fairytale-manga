module Api
  module V1
    module Admins
      class GiftsController < AdminappController
        def create
          @gift = Gift.new(gift_params)
          @gift.image.attach(params[:image])
          if @gift.save
            render json: {
              id: @gift.id,
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
                                  each_serializer: GiftSerializer })
        end

        def show
          @gift = Gift.find(params[:id])
          render json: @gift, each_serializer: GiftSerializer
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
          @readergift = ReaderGift.where(reader_id: params[:id])
          # render json: @gift
          if @readergift.count == 0
            if @gift.destroy
              render json: {
                message: "destroy successfuly",
              }
            else
              render json: {
                message: "destroy failed",
              }, status: 400
            end
          elsif @readergift.count != 0
            render json: {
              message: "This Gift has been changed by reader. Do you want compensation?",
            }
          end
        end

        def compensation
          @gift = Gift.find(params[:id])
          @readergift = ReaderGift.where(gift_id: params[:id])
          @readergift.each do |rg|
            if rg.received == false
              @reader = Reader.find(rg.reader_id)
              @gift = Gift.find(rg.gift_id)
              if @reader.update(score: @gift.score + @reader.score)
                render json: "dc r"
              else
                render json: {
                  message: "ko dc",
                  validates: @reader.errors.messages
                }
              end
              @title = "Opp. Your gift is "+ @gift.name+ " has been deleted. I am sorry because this trouble. Your score has been restored"
              @notification = Notification.create(reader_id: rg.reader_id, title: @title)
              # rg.destroy
            else
              rg.destroy
            end
          end
          # @gift.destroy
          
          # binding.pry 
          
        end

        # def received
        #   @readergift = ReaderGift.find_by(gift_id: params[:id])
        #   @readergift.update(received: true)
        #   @gift = Gift.find_by(id: params[:id])
        #   title = "Your gift is has been received. Please check!"
        #   Notification.create(title, params[:reader_id])
        #   render json: {
        #     message: "User are received",
        #   }
        # end

        private

        def gift_params
          params.permit(:name, :score, :stock, :image)
        end
      end
    end
  end
end
