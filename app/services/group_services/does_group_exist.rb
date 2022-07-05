class GroupServices::DoesGroupExist
  @groupName
  def initialize(groupName)
    @groupName = groupName
  end

  def call
    return GroupName.where(groupNames: @groupName).present?
  end

end
