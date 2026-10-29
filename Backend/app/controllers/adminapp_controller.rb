class AdminappController < ApplicationController
  before_action :authenticate_request_admin
  before_action :authorize_admin!

  private

  # RBAC: Admin#can? decides by controller + action (see Admin::MODERATOR_PERMISSIONS).
  def authorize_admin!
    return if performed? || @current_admin.can?(controller_name, action_name)

    response_error({ message: "You don't have permission to do this" }, :forbidden)
  end
end
