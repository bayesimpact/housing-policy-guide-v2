class Admin::PoliciesController < AdminController
  def index
    @resources = Policy.all
  end

  def new
    @policy = Policy.new
  end
end
