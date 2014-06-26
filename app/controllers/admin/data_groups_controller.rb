class Admin::DataGroupsController < ApplicationController
  def index
    @data_group_tree = DataGroupService.new(DataGroup.all.includes(:datasets)).tree
  end

  def new
    @data_group = DataGroup.new
    @data_groups = DataGroup.all
    @super_data_groups = @data_groups.select { |data_group| data_group.is_super_group? }
    @datasets = Dataset.all
  end

  def create
    data_group = DataGroup.new(data_group_params)
    if !!params[:data_group][:child_ids]
      # for super groups
      data_group.children = DataGroup.find(params[:data_group][:child_ids])
    else
      # for non-super groups
      data_group.datasets = Dataset.find(params[:data_group][:dataset_ids])
    end

    if data_group.save
      redirect_to admin_data_group_path data_group
    else
      flash[:errors] = data_group.errors
      render :new
    end
  end

  def show
    @data_group = DataGroup.includes(:datasets).find(params[:id])
    @children = DataGroup.where(parent_id: @data_group.id)
    @data_group_tree = DataGroupService.new(DataGroup.all.includes(:datasets)).tree
  end

  def edit
    @data_group = DataGroup.find(params[:id])
    @data_groups = DataGroup.all
    @super_data_groups = @data_groups.select { |data_group| data_group.is_super_group? }
    @datasets = Dataset.all
  end

  def update
    data_group = DataGroup.find(params[:id])
    if !!params[:data_group][:child_ids]
      # for super groups
      data_group.children = DataGroup.find(params[:data_group][:child_ids])
    else
      # for non-super groups
      data_group.datasets = Dataset.find(params[:data_group][:dataset_ids])
    end

    data_group.assign_attributes(data_group_params)
    if data_group.save
      flash[:notice] = "Data group '#{data_group.name}' was updated successfully."
      redirect_to admin_data_group_path data_group
    else
      flash[:errors] = data_group.errors
      render :edit
    end
  end

  def destroy
    @data_group = DataGroup.find(params[:id])

    if @data_group.delete
      redirect_to admin_data_groups_path
    else
      flash[:errors] = @data_group.errors
      render admin_data_groups_path
    end
  end

  private

  def data_group_params
    params.require(:data_group).permit(:name, :parent_id, :is_super_group)
  end
end
