class DatasetsController < ApplicationController
  def index
    @data_group_tree = DataGroupService.new(DataGroup.all.includes(:datasets)).tree
  end
end
