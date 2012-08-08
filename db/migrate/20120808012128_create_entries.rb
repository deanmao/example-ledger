class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :amount
      t.integer :account_id
      t.integer :ftransaction_id
      t.boolean :source
      t.string :type

      t.timestamps
    end
  end
end
