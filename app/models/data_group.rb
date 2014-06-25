class DataGroup < ActiveRecord::Base
  has_many :data_group_policies
  has_many :policies, through: :data_group_policies

  has_many :data_group_datasets
  has_many :datasets, through: :data_group_datasets

  belongs_to :parent, class_name: 'DataGroup'
  has_many :children, class_name: 'DataGroup', foreign_key: 'parent_id'

  scope :with_parents, -> { where('parent_id IS NOT NULL')}
end
