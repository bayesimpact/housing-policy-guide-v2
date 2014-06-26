  # Service meant to build tree structure for data groups.
  # Test in Rails console, DataGroupService.new(DataGroup.all).tree
  # Meant to produce this structure
  # [
  #    {
  #     element: data_group_parent,
  #     children: [
  #       {
  #         element: data_group,
  #         children: [
  #           dataset
  #         ]
  #       }
  #     ]
  #   },
  #   {
  #     element: data_group_parent,
  #     children: [
  #       {
  #         element: data_group,
  #         children: [
  #           dataset
  #         ]
  #       }
  #     ]
  #   }
  # ]

class DataGroupService
  attr_accessor :data_groups

  def initialize(data_groups)
    self.data_groups = data_groups
  end

  def data_group_parents
    data_groups - data_groups.with_parents
  end

  def tree
    data_group_parents.map do |data_group_parent|
      parent_group = { element: data_group_parent, children: [] }
      data_groups.each do |data_group|
        child_group = { element: data_group, children: [] }
        child_group[:children] = data_group.datasets
        parent_group[:children] << child_group if data_group.parent == data_group_parent
      end
      parent_group
    end
  end
end