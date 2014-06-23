class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.text    :source_description
      t.text    :notes
      t.string  :visualization_url
      t.string  :source_url
      t.timestamps
    end
  end
end
