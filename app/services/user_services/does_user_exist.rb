class UserServices::DoesUserExist
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def call
    return User.where(name: name).present?
  end

end
