module Api
  module V1
    module Readers
      class SessionsController < ApplicationController
        skip_before_action :authenticate_request, only: [:create]
        def create
          reader = Reader.find_by(email: params[:email])
          if reader && reader.valid_password?(params[:password])
            render json: {
              message: "success",
              token: ::JsonWebToken.encode({
                                            sub: reader.id
              })
            }
          else
            render json: {
              message: "failed",
              validate: "Wrong Email Or Password"
            }, status: 400
          end
        end 
      end
    end
  end
end