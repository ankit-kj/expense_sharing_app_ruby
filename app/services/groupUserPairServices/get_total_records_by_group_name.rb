class GroupUserPairServices::GetTotalRecordsByGroupName
  @groupName
  def initialize(groupName)
    @groupName = groupName
  end

  def call
    records = GroupUserPair.where(groupName: @groupName)
    return records
  end

end
