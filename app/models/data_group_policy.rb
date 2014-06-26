class DataGroupPolicy < ActiveRecord::Base
  belongs_to :policy
  belongs_to :data_group
end
