class CreateAuditTables < ActiveRecord::Migration[7.0]
  def change
    create_table :audit_tables do |t|
      t.string :userName1
      t.string :userName2
      t.integer :amount
    end
  end
end
