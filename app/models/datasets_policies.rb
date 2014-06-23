class DatasetsPolicies < ActiveRecord::Base
  belongs_to :data_set
  belongs_to :policy
end
