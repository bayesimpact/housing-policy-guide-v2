class CreateDataGroups < ActiveRecord::Migration
  def change
    create_table :data_groups do |t|
      t.integer     :parent_id
      t.timestamps
    end
  end
end
