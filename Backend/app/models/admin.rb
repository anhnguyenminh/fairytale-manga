class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable
  has_one_attached :image
  attribute :image_url
  after_find :set_image_url

  ROLES = %w[admin moderator].freeze

  # What a moderator (kiểm duyệt viên) may do: work with stories only. They can add
  # stories/chapters and decide draft/published, but never delete.
  # Anything an admin account does is allowed; everyone may manage their own profile.
  OWN_PROFILE_ACTIONS = %w[show_current_admin update_profile update_admin].freeze
  MODERATOR_PERMISSIONS = {
    "stories" => %w[index show create update get_authors get_categories show_list_chapters set_publish_status],
    "chapters" => %w[show create],
  }.freeze

  validates :role, inclusion: { in: ROLES }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :email, presence: true, uniqueness: true

  def admin?
    role == "admin"
  end

  def moderator?
    role == "moderator"
  end

  def can?(resource, action)
    return true if admin?
    return true if resource == "admins" && OWN_PROFILE_ACTIONS.include?(action)

    MODERATOR_PERMISSIONS.fetch(resource, []).include?(action)
  end
end
