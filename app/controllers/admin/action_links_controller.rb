class Admin::ActionLinksController < AdminController
  def index
    @resources = ActionLink.all
  end

  def show
    @action_link = ActionLink.find(params[:id])
  end

  def create
    @action_link = ActionLink.new(action_link_params)
    if @action_link.save
      flash[:notice] = 'Action link saved!'
      redirect_to admin_action_link_path(@action_link.id)
    else
      flash[:error] = @action_link.errors.full_messages
      render :new
    end
  end

  def new
    @action_link = ActionLink.new
    @policies = Policy.all
  end

  def edit
    @action_link = ActionLink.find(params[:id])
    @policies = Policy.all
  end

  def update
    @action_link = ActionLink.find(params[:id])
    if @action_link.update_attributes(action_link_params)
      flash[:notice] = "Action link '#{@action_link.name}'' successfully updated"
      redirect_to admin_action_link_path
    else
      flash[:error] = "Could not update action link '#{@action_link.name}'"
      render :edit
    end
  end

  private

  def action_link_params
    params.require(:action_link).permit(:name, :description, :url, :policy_id)
  end
end
