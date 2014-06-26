class Admin::DataGroupsController < ApplicationController
  def index
    @data_groups = DataGroup.all
  end

  def new
    @data_group = DataGroup.new
    @parent_data_groups = DataGroup.all - DataGroup.with_parents
    @data_groups_with_parents = DataGroup.with_parents
    @datasets = Dataset.all
  end

  def create
    if !data_group_params[:child_ids].nil?
      # for super groups
    else
      # for non-super groups
      data_group = DataGroup.new(data_group_params)
      data_group.datasets = Dataset.find(params[:data_group][:dataset_ids])
      if data_group.save
        redirect_to admin_data_group_path data_group
      else
        flash[:errors] = data_group.errors
        render :new
      end
    end
  end

  def show
    @data_group = DataGroup.includes(:datasets).find(params[:id])
    @children = DataGroup.where(parent_id: @data_group.id)
  end

  def data_group_params
    params.require(:data_group).permit(:name, :parent_id)
  end
end
