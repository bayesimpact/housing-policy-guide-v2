class Dataset < ActiveRecord::Base
  has_many :datasets_policies
  has_many :policies, through: :datasets_policies

  has_many :data_groups_datasets
  has_many :data_groups, through: :data_groups_datasets
end
