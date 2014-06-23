module Admin
  extend ActiveSupport::Concern

  before_filter :verify_is_admin

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end