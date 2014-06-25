class CreateDataGroupPolicies < ActiveRecord::Migration
  def change
    create_table :data_group_policies do |t|
      t.integer     :data_group_id,   null: false
      t.integer     :policy_id,       null: false
      t.timestamps
    end
  end
end
