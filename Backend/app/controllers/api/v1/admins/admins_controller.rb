module Api
  module V1
    module Admins
      # Staff accounts. Who may do what is decided by Admin#can? (which actions) and
      # Admin#manageable_roles (which accounts): owners manage everyone, admins only add and
      # remove moderators, moderators nothing. Every role may edit their own profile.
      class AdminsController < AdminappController
        before_action :set_admin, only: [:update, :destroy]

        def index
          @pagy, @admins = pagy(Admin.order(id: :desc), items: 10)
          response_list(@admins, { adapter: :json, each_serializer: AdminSerializer })
        end

        def create
          role = staff_params[:role].presence || "moderator"
          return forbid_role unless current_admin.manageable_roles.include?(role)

          admin = Admin.new(staff_params.merge(role: role))
          if admin.save
            response_success(message: "Ok")
          else
            response_error(validation: admin.errors.full_messages)
          end
        end

        def update
          new_role = staff_params[:role]
          if @admin == current_admin && new_role.present? && new_role != @admin.role
            return response_error(message: "You cannot change your own role")
          end
          return forbid_role if new_role.present? && !current_admin.manageable_roles.include?(new_role)
          return response_error(message: "At least one owner must remain") if new_role.present? && new_role != "owner" && last_owner?(@admin)

          if @admin.update(staff_params.except(:password))
            response_success(message: "Update Successfully")
          else
            response_error(validation: @admin.errors.full_messages)
          end
        end

        def destroy
          return response_error(message: "You cannot delete your own account") if @admin == current_admin
          return forbid_role unless current_admin.manageable_roles.include?(@admin.role)
          return response_error(message: "At least one owner must remain") if last_owner?(@admin)

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

        def last_owner?(admin)
          admin.owner? && Admin.where(role: "owner").count <= 1
        end

        def forbid_role
          response_error({ message: "You don't have permission to manage this account" }, :forbidden)
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
