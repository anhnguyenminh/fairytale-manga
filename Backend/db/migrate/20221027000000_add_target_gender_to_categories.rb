class AddTargetGenderToCategories < ActiveRecord::Migration[6.1]
  def change
    # NULL means the category is suggested to every reader.
    add_column :categories, :target_gender, :string
  end
end
