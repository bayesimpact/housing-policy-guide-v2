class AddTitleToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :chart_title, :string
  end
end
