module Api
	module V1
		module Admins
			class AdminsController < ApplicationController
        # skip_before_action :authenticate_request, only: [:create]				
				def create
					@admin = Admin.new(admin_params)
					if @admin.save
						render json: {
							messages: "create Successfully"
						}
					else
						render json: {
							messages: "failed"
						}
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