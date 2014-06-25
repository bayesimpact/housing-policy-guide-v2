class Admin::DatasetsController < ApplicationController
  def index
    @resources = Dataset.all
  end

  def new
    @dataset = Dataset.new
  end

  def edit
    @dataset = Dataset.find(params[:id])
  end
end
