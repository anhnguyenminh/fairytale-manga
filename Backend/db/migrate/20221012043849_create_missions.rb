class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|

      t.timestamps
    end
  end
end
