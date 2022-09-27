class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.references :reader, null: false, foreign_key: true  
      t.string :cmt_in, null: false
      t.integer :id_where_cmt , null: false
      t.timestamps
    end
  end
end
