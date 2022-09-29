module Api
	module V1
		module Admins
			class AdminsController < ApplicationController
        # skip_before_action :authenticate_request, only: [:create]				
				# def create
				# 	@admin = Admin.new(admin_params)
				# 	if @admin.save
				# 		render json: {
				# 			messages: "create Successfully"
				# 		}
				# 	else
				# 		render json: {
				# 			messages: "failed"
				# 		}
				# 	end
				# end
				
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
						params.permit(:email,:username, :password)
					end
			end		
				
		end
	end
end