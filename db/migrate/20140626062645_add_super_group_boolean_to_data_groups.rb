class AddSuperGroupBooleanToDataGroups < ActiveRecord::Migration
  def change
    add_column :data_groups, :is_super_group, :boolean, null: false, default: false
  end
end
