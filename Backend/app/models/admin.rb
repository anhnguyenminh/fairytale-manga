class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable
  has_one_attached :image
  attribute :image_url
  after_find :set_image_url

  # owner > admin (quản trị viên) > moderator (kiểm duyệt viên)
  ROLES = %w[owner admin moderator].freeze

  # Everyone may manage their own profile and credentials.
  OWN_PROFILE_ACTIONS = %w[show_current_admin update_profile update_admin].freeze

  # Account management (the staff page). Owners may do all of it; admins may only list
  # accounts and add/remove moderators (see #manageable_roles); moderators may do none.
  ADMIN_STAFF_ACTIONS = %w[index create destroy].freeze

  # What a moderator may do: work with stories only. They can add stories/chapters and
  # decide draft/published, but never delete.
  MODERATOR_PERMISSIONS = {
    "stories" => %w[index show create update get_authors get_categories show_list_chapters set_publish_status],
    "chapters" => %w[show create],
    "search" => %w[index],
  }.freeze

  validates :role, inclusion: { in: ROLES }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :email, presence: true, uniqueness: true

  def owner?
    role == "owner"
  end

  def admin?
    role == "admin"
  end

  def moderator?
    role == "moderator"
  end

  # Owners and admins run the site's content; moderators only get the story tools.
  def management?
    owner? || admin?
  end

  # Roles this account may create, change and delete.
  def manageable_roles
    return ROLES if owner?
    return %w[moderator] if admin?

    []
  end

  def can?(resource, action)
    return true if owner?
    return OWN_PROFILE_ACTIONS.include?(action) || (admin? && ADMIN_STAFF_ACTIONS.include?(action)) if resource == "admins"
    return true if admin?

    MODERATOR_PERMISSIONS.fetch(resource, []).include?(action)
  end
end
