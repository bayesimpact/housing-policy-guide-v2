class ActionLink < ActiveRecord::Base
  has_many :policy_action_links
  has_many :policies, through: :policy_action_links
end
