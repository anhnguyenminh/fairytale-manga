module Api
  module V1
    module Admins
      class SessionsController < ApplicationController
        def create
          @admin = Admin.find_by( email: params[:email])
          if @admin && @admin.valid_password?(params[:password])
            sign_in(:admin, @admin)
            # render json: {
            #   message: 'sucesss',
            #   token: ::JsonWebToken.encode({
            #                                sub: @admin.id
            #                              })
            # }
            
            if admin_signed_in?
              render json: {
                message: current_admin.id
              }
            else
              render json: {
                message: "chua dn tc"
              }
            end
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