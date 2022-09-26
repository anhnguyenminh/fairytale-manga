require 'json_web_token'

module Api
  module V1
    module Admins
      class AdminsController < ApplicationController
        def index
          @admins = Admin.all
          render json: @admins
        end

        def create
          @admin = Admin.new(admin_params)
          if @admin.save
            render json: {
              message: "success",
              token: JsonWebToken.encode({
                                            sub: @admin.id
              })
            }
          else 
            render json: {
              message: "failed",
              validation: @admin.errors.messages
            }, status: 400 
          end
        end

        def update
          @admin = Admin.find(params[:id])
            if @admin.update(admin_params)
              render json: {
                message: "Update Successfully"
              }
            else
              render json:{
                message: "Failed",
                validation: @admin.errors.messages
              }, status: 400
            end
        end
  
        private 
          def admin_params
            params.permit(:email, :password)
          end
      end
    end
  end
end