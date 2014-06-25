class DataGroupsPolicies < ActiveRecord::Base
  belongs_to :policies
  belongs_to :data_groups
end
