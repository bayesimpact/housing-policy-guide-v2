class DatasetsController < ApplicationController
  def index
    respond_to do |format|
    @data_group_tree = DataGroupService.new(DataGroup.all.includes(:datasets)).tree
      format.html
      format.json { render json: Dataset.all.to_json }
    end
  end
end
