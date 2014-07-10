class DestroyPolicyIdOnActionLinks < ActiveRecord::Migration
  def up
    remove_column :action_links, :policy_id
  end

  def down
    add_column :action_links, :policy_id, :integer
  end
end
