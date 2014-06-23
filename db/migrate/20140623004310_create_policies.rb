class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.string      :name
      t.string      :summary
      t.text        :description
      t.text        :organization_text
      t.text        :resources_text
      t.timestamps
    end
  end
end
