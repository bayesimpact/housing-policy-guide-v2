class DatasetsPolicies < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :policy
end
