class Admin::ActionLinksController < AdminController
  def index
    @resources = ActionLink.all
  end

  def show
    @action_link = ActionLink.find(params[:id])
  end
end
