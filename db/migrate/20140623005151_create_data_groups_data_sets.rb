class CreateDataGroupsDataSets < ActiveRecord::Migration
  def change
    create_table :data_groups_data_sets do |t|
      t.integer     :data_group_id, null: false
      t.integer     :data_set_id,   null: false
      t.timestamps
    end
  end
end
