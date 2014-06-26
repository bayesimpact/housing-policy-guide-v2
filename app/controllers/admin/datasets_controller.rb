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

  def show
    @dataset = Dataset.find(params[:id])
  end

  def destroy
    @dataset = Dataset.find(params[:id])
    if @dataset.destroy
      flash[:notice] = "Dataset '#{@dataset.name}' was deleted successfully."
    else
      flash[:errors] = @dataset.errors
    end
    redirect_to :admin_datasets
  end
end
