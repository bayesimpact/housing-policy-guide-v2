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
  end
end
