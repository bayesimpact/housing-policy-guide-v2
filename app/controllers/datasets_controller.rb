class DatasetsController < ApplicationController
  def index
    @data_groups = DataGroup.all
    @datasets = Dataset.all
  end
end
