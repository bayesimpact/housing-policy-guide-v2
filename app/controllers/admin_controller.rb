class AdminController < ApplicationController
  before_filter :verify_is_admin

  def verify_is_admin
    redirect_to(root_path) unless admin_signed_in?
  end
end