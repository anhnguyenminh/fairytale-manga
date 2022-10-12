module Api
  module V1
    module Admins
      class MissionsController < ApplicationController
        def create
          @mission = Mission.new(mission_params)
          if @mission.save
            render json: {
              message: "Create Successful"
            }
          else
            render json: {
              @mission.messages.errors
            }, status: 400
          end
        end

        def index
          @missions = Mission.all
          render json: @missions
        end

        def update
          @mission = Mission.find(params[:id])
          if @mission.update(mission_params)
            render json: "Update Successfully"
          else
            render json: {
                     message: "Failed",
                     validation: @mission.errors.messages,
                   }, status: 400
          end
        end
        
        
        private
        
        def mission_params
          params.permit(:name, :score)
        end
      end
    end
  end
end