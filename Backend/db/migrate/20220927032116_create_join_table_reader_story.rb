class CreateJoinTableReaderStory < ActiveRecord::Migration[6.1]
  def change
    create_join_table :reader, :story do |t|
      t.index :reader_id
      t.index :story_id
      t.integer :chap
      t.datetime :reader_at
      t.timestamps
    end
  end
end
