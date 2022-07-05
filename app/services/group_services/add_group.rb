class GroupServices::AddGroup
  @grpName
  def initialize(groupName)
    @grpName = groupName
  end

  def call
    newGroup = GroupName.new(groupNames: @grpName)
    newGroup.save
  end

end
