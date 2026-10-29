class PromoteFirstAdminToOwner < ActiveRecord::Migration[6.1]
  # The new "owner" role sits above admin. Make sure an existing installation is not
  # left without one by promoting its oldest account.
  def up
    execute <<~SQL
      UPDATE admins SET role = 'owner'
      WHERE id = (SELECT id FROM (SELECT MIN(id) AS id FROM admins) AS first_admin)
    SQL
  end

  def down
    execute "UPDATE admins SET role = 'admin' WHERE role = 'owner'"
  end
end
