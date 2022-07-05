class AuditServices::DoesPairExist
  @user1
  @user2
  def initialize(user1 , user2)
    @user1 = user1
    @user2 = user2
  end

  def call
    return AuditTable.where("userName1": @user1, "userName2": @user2).present?
  end

end
