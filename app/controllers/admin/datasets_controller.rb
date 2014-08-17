class Admin::DatasetsController < AdminController
  def index
    @resources = Dataset.all
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.new(dataset_params)
    if @dataset.save
      flash[:notice] = "Dataset '#{@dataset.name} was created successfully."
      redirect_to admin_dataset_path(@dataset)
    else
      flash[:errors] = @dataset.errors
      render :new
    end
  end

  def edit
    @dataset = Dataset.find(params[:id])
  end

  def update
    @dataset = Dataset.find(params[:id])
    @dataset.assign_attributes(dataset_params)
    if @dataset.save
      flash[:notice] = "Dataset '#{@dataset.name} was updated successfully."
      redirect_to admin_dataset_path(@dataset)
    else
      flash[:errors] = @dataset.errors
      render :edit
    end
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

  private

  def dataset_params
    params.require(:dataset).permit(:name, :chart_title, :notes, :source_description, :source_url, :visualization_iframe)
  end
end
