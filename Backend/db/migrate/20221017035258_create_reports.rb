class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.belongs_to :reader
      t.belongs_to :comment
      t.integer :num_report, :null => false, default: 1
      t.timestamps
    end
  end
end
