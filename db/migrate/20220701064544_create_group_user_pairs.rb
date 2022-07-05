class CreateGroupUserPairs < ActiveRecord::Migration[7.0]
  def change
    create_table :group_user_pairs do |t|
      t.integer :userId
      t.integer :groupId
      t.string :userName
      t.string :groupName
    end
  end
end
