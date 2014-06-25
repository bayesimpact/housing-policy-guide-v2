class Dataset < ActiveRecord::Base
  has_many :dataset_policies
  has_many :policies, through: :dataset_policies

  has_many :data_group_datasets
  has_many :data_groups, through: :data_group_datasets
end
