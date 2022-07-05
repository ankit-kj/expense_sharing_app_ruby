class AuditServices::UpdateTransaction
  @user1
  @user2
  @amount
  def initialize(user1,user2,amount)
    @user1 = user1
    @user2 = user2
    @amount = amount
  end

  def call
    record = AuditTable.find_by(userName1: @user1,userName2: @user2)
    record.amount += @amount
    record.save
  end
end
