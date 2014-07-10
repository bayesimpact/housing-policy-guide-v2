class PolicyActionLink < ActiveRecord::Base
  belongs_to :policy
  belongs_to :action_link
end
