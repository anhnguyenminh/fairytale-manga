class CreateReaderReportTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :reader, :report do |t|
      t.index :reader_id
      t.index :report_id
      t.timestamps
    end
  end
end
