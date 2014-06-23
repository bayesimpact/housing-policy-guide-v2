class DataGroupsDataSets < ActiveRecord::Base
  belongs_to :data_group
  belongs_to :data_set
end
