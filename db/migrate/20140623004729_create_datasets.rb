class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string  :name,                  null: false
      t.text    :source_description
      t.text    :notes
      t.text    :visualization_iframe
      t.string  :source_url
      t.timestamps
    end
  end
end
