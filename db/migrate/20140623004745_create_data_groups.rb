class CreateDataGroups < ActiveRecord::Migration
  def change
    create_table :data_groups do |t|
      t.string      :name,        null: false
      t.integer     :parent_id
      t.timestamps
    end
  end
end
