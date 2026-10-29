class AddPublishStatusToStories < ActiveRecord::Migration[6.1]
  def up
    add_column :stories, :publish_status, :string, null: false, default: "draft"
    # Stories that already exist were visible to readers, so keep them published.
    execute "UPDATE stories SET publish_status = 'published'"
  end

  def down
    remove_column :stories, :publish_status
  end
end
