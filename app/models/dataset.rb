class Dataset < ActiveRecord::Base
  has_many :data_sets_policies
  has_many :policies, through: :data_sets_policies

  has_many :data_groups_data_sets
  has_many :data_groups, through: :data_groups_data_sets
end
