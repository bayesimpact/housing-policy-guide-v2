class DatasetsController < ApplicationController
  def index
    @data_group_tree = DataGroupService.new(DataGroup.all.includes(:datasets)).tree
    
    respond_to do |format|
      format.html
      format.json { render json: Dataset.all.to_json }
    end
  end

  def show
    @dataset = Dataset.find(params[:id])
    
    respond_to do |format|
      format.json { render json: @dataset }
    end
  end
end
