class DataGroup < ActiveRecord::Base
  has_many :data_group_policies
  has_many :policies, through: :data_group_policies

  has_many :data_group_data_sets
  has_many :data_sets, through: :data_group_data_sets

  belongs_to :parent, class_name: 'DataGroup'
  has_many :children, class_name: 'DataGroup', foreign_key: 'parent_id'
end
