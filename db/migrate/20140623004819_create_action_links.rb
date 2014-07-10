class CreateActionLinks < ActiveRecord::Migration
  def change
    create_table :action_links do |t|
      t.integer     :policy_id
      t.string      :url,         null: false
      t.string      :name,        null: false
      t.text        :description
      t.timestamps
    end
  end
end
