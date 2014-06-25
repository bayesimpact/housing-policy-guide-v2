class DataGroupDataset < ActiveRecord::Base
  belongs_to :data_group
  belongs_to :dataset
end
