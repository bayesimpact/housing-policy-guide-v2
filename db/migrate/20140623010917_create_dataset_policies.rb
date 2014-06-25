class CreateDatasetPolicies < ActiveRecord::Migration
  def change
    create_table :dataset_policies do |t|
      t.integer       :dataset_id,  null: false
      t.integer       :policy_id,   null: false
      t.timestamps
    end
  end
end
