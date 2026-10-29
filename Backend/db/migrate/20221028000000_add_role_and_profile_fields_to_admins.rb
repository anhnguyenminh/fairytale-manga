class AddRoleAndProfileFieldsToAdmins < ActiveRecord::Migration[6.1]
  def change
    # role: "admin" (quản trị viên) or "moderator" (kiểm duyệt viên)
    add_column :admins, :role, :string, null: false, default: "admin"
    add_column :admins, :full_name, :string
    add_column :admins, :phone, :string
    add_column :admins, :bio, :text
  end
end
