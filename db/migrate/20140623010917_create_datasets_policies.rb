class CreateDatasetsPolicies < ActiveRecord::Migration
  def change
    create_table :datasets_policies do |t|
      t.integer       :dataset_id,  null: false
      t.integer       :policy_id,   null: false
      t.timestamps
    end
  end
end
