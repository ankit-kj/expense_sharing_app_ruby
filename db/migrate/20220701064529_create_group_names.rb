class CreateGroupNames < ActiveRecord::Migration[7.0]
  def change
    create_table :group_names do |t|
      t.string :groupNames


    end
  end
end
