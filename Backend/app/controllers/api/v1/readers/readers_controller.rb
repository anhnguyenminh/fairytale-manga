module Api
  module V1
    module Readers
      class ReadersController < ReaderappController
        skip_before_action :authenticate_request_reader, only: [:create]
        def create
          @reader = Reader.new(reader_params)
          if @reader.save
            @reader.image.attach(params[:reader][:image])
            UserMailer.reader_activation(@reader).deliver_now 
            render json: {
              message: "Wait email message"
            }
          else 
            render json: {
              message: "failed",
              validation: @reader.errors.messages
            }, status: 400 
          end
        end

        private 
          def reader_params
            params.permit(:name, :email, :password, :age, :gender, :phonenumber, :address, :image)
          end
      end
    end
  end
end
