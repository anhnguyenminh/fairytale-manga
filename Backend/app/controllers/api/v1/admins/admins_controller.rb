module Api
  module V1
    module Admins
      class AdminsController < AdminappController
        skip_before_action :authenticate_request_admin, only: [:create]

        def create
          @admin = Admin.new(admin_params)
          if @admin.save
            render json: {
                     message: "success",
                   }
          else
            render json: {
                     message: "failed",
                     validation: @category.errors.messages,
                   }, status: 400
          end
        end

        def index
          admins = Admin.order(id: :desc).ransack(params[:q]).result
          @pagy, @admins = pagy(admins, items: 5)
          response_list(@admins, { adapter: :json,
                                   each_serializer: nil })
        end

        def showcurrentadmin
          header = params[:token]
          header = header.split(" ").last
          decode = JsonWebToken.decode(header)
          @current_admin = Admin.find_by(id: decode[:admin_id])
          render json: @current_admin
        end

        def update
          @admin = Admin.find(params[:id])
          if @admin.update(admin_params)
            render json: {
                     message: "Update Successfully",
                   }
          else
            render json: {
                     message: "Failed",
                     validation: @admin.errors.messages,
                   }, status: 400
          end
        end

        private

        def admin_params
          params.permit(:email, :username, :password)
        end
      end
    end
  end
end
