module Api
  module V1
    module Admins
      # Staff accounts. Listing/creating/changing/removing accounts is admin-only (see
      # Admin#can?); every role may read and edit their own profile and credentials.
      class AdminsController < AdminappController
        before_action :set_admin, only: [:update, :destroy]

        def index
          @pagy, @admins = pagy(Admin.order(id: :desc), items: 10)
          response_list(@admins, { adapter: :json, each_serializer: AdminSerializer })
        end

        def create
          admin = Admin.new(staff_params)
          if admin.save
            response_success(message: "Ok")
          else
            response_error(validation: admin.errors.full_messages)
          end
        end

        def update
          if @admin == current_admin && staff_params[:role].present? && staff_params[:role] != @admin.role
            return response_error(message: "You cannot change your own role")
          end
          return response_error(message: "At least one administrator must remain") if demoting_last_admin?

          if @admin.update(staff_params.except(:password))
            response_success(message: "Update Successfully")
          else
            response_error(validation: @admin.errors.full_messages)
          end
        end

        def destroy
          return response_error(message: "You cannot delete your own account") if @admin == current_admin
          return response_error(message: "At least one administrator must remain") if last_admin?(@admin)

          @admin.destroy
          response_success(message: "destroy successfully")
        end

        def show_current_admin
          response_success(current_admin, { serializer: AdminSerializer })
        end

        def update_profile
          current_admin.image.attach(params[:image]) if params[:image].present?
          if current_admin.update(profile_params)
            response_success(current_admin, { serializer: AdminSerializer })
          else
            response_error(validation: current_admin.errors.full_messages)
          end
        end

        # Email and password changes need the current password.
        def update_admin
          unless current_admin.valid_password?(params[:oldPassword])
            return response_error(message: "Current password is incorrect")
          end
          if params[:password].present? && params[:password] != params[:reEnterPwd]
            return response_error(message: "Confirm password must match the new password")
          end

          attrs = { email: params[:email] }.compact
          attrs[:password] = params[:password] if params[:password].present?
          if current_admin.update(attrs)
            response_success(message: "Update Successfully")
          else
            response_error(validation: current_admin.errors.full_messages)
          end
        end

        private

        def set_admin
          @admin = Admin.find(params[:id])
        end

        def last_admin?(admin)
          admin.admin? && Admin.where(role: "admin").count <= 1
        end

        def demoting_last_admin?
          staff_params[:role].present? && staff_params[:role] != "admin" && last_admin?(@admin)
        end

        def profile_params
          params.permit(:username, :full_name, :phone, :bio)
        end

        def staff_params
          params.permit(:email, :username, :full_name, :phone, :bio, :password, :role)
        end
      end
    end
  end
end
