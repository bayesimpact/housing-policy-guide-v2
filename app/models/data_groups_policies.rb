class DataGroupsPolicies < ActiveRecord::Base
  belongs_to :policies
  belongs_to :data_groups

  scope :with_parents, -> { where('parent_id IS NOT NULL')}
end
