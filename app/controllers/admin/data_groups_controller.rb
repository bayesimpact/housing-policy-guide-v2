class Admin::DataGroupsController < ApplicationController
  def index
    @data_groups = DataGroup.all
  end

  def new
    @data_group = DataGroup.new
  end
end
