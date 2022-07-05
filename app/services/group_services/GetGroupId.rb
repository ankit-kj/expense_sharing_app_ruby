class GroupServices::GetGroupId
  @groupName

  def initialize(groupName)
    @groupName = groupName
  end

  def call
    groupDraft = GroupName.find_by(groupNames: @groupName)
    return groupDraft.id
  end

end
