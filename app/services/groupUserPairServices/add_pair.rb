class GroupUserPairServices::AddPair
  @groupUserPairDraft
  # @pairDraft
  def initialize(groupUserPairDraft)
    @groupUserPairDraft = groupUserPairDraft

  end

  def call
    groupUserPair = GroupUserPair.new(userId: @groupUserPairDraft["userId"] ,groupId: @groupUserPairDraft["groupId"] ,userName: @groupUserPairDraft["userName"], groupName: @groupUserPairDraft["groupName"])
    groupUserPair.save
    return groupUserPair
  end
end




