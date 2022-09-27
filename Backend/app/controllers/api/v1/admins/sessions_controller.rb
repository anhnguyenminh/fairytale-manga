require 'json_web_token'

module Api
  module V1
    module Admins
      class SessionsController < ApplicationController
        skip_before_action :authenticate_request, only: [:create]
        def create
          @admin = Admin.find_by( email: params[:email])
          if @admin && @admin.valid_password?(params[:password])
            # sign_in(:user, @user)
            render json: {
              message: 'success',
              token: ::JsonWebToken.encode({
                                           sub: @admin.id
                                         })
            }
          else
            render json: {
              message: 'failed',
              validate: "Password Or Username failed."
            }, status: 400
          end
        end
      end
    end
  end
end