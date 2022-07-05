class UserServices::AddUser
  @userDraft

  def initialize(userDraft)
    @userDraft = userDraft
  end

  def call
    user = User.new(name: @userDraft[:name],email: @userDraft[:email],mobile: @userDraft[:mobile])
    user.save
    return user.id

    # groupDraft = GroupName.find_by(groupNames: @userDraft[:groupName])

    # hash ={
    #   "userId" => user.id,
    #   "groupId" => groupDraft.id,
    #   "userName" => @userDraft[:name],
    #   "groupName" => @userDraft[:groupName]
    # }

    # AddPair.new(hash).call
    # GroupUserPairServices::AddPair.new(hash).call

  end
end

