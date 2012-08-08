class CreateFtransactions < ActiveRecord::Migration
  def change
    create_table :ftransactions do |t|
      t.string :state
      t.string :type

      t.timestamps
    end
  end
end
