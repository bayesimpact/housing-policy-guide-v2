class CreatePolicyActionLinks < ActiveRecord::Migration
  def change
    create_table :policy_action_links do |t|
      t.integer     :policy_id,       null: false
      t.integer     :action_link_id,  null: false
      t.timestamps
    end
  end
end
