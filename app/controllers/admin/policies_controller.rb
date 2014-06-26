class Admin::PoliciesController < AdminController
  def index
    @resources = Policy.all
  end

  def new
    @policy = Policy.new
    @data_groups = DataGroup.policy_groups
  end

  def create
    policy = Policy.new(policy_params)
    policy.data_groups = DataGroup.find(params[:policy][:data_group_ids])
    if policy.save
      flash[:notice] = "Policy '#{@policy.name}' was saved successfully."
      redirect_to :admin_policies
    else
      flash[:errors] = policy.errors
      render :new
    end
  end

  def edit
    @policy = Policy.where(id: params[:id]).first
    @data_groups = DataGroup.policy_groups
    redirect_to :admin_policies if @policy.nil?
  end

  def update
    @policy = Policy.find(params[:id])
    @policy.assign_attributes(policy_params)
    @policy.data_groups = DataGroup.find(params[:policy][:data_group_ids])
    if @policy.save
      flash[:notice] = "Policy '#{@policy.name}' was updated successfully."
      redirect_to :admin_policy
    else
      flash[:errors] = @policy.errors
      render :edit
    end
  end

  def show
    @policy = Policy.includes(:data_groups).find(params[:id])
  end

  def destroy
    @policy = Policy.find(params[:id])
    if @policy.destroy
      flash[:notice] = "Policy '#{@policy.name}' was deleted successfully."
    else
      flash[:errors] = @policy.errors
    end
    redirect_to :admin_policies
  end

  private

  def policy_params
    params.require(:policy).permit(:name, :summary, :description, :organization_text, :resources_text, :thumbnail_image_url, :masthead_image_url)
  end
end
