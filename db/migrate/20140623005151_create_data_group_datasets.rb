class CreateDataGroupDatasets < ActiveRecord::Migration
  def change
    create_table :data_group_datasets do |t|
      t.integer     :data_group_id, null: false
      t.integer     :dataset_id,   null: false
      t.timestamps
    end
  end
end
