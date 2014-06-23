class CreateActionLinks < ActiveRecord::Migration
  def change
    create_table :action_links do |t|
      t.integer     :policy_id
      t.timestamps
    end
  end
end
