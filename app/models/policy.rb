class Policy < ActiveRecord::Base
  has_many :data_group_policies
  has_many :data_groups, through: :data_group_policies
  has_many :action_links
  has_many :datasets_policies
  has_many :datasets, through: :datasets_policies
end
