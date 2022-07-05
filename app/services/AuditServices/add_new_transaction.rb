class AuditServices::AddNewTransaction
  @user1
  @user2
  @amount
  def initialize(user1,user2,amount)
    @user1 = user1
    @user2 = user2
    @amount = amount
  end

  def call
    newTransaction = AuditTable.new(userName1: @user1,userName2: @user2,amount: @amount)
    newTransaction.save
  end

end
