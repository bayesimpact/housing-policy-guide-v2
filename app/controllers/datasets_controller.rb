class DatasetsController < ApplicationController
  def index
    @data_groups = DataGroup.all.includes(:datasets)
  end
end
