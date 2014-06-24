class AddImagesToPolicies < ActiveRecord::Migration
  def change
    add_column :policies, :thumbnail_image_url, :string
    add_column :policies, :masthead_image_url, :string
  end
end
