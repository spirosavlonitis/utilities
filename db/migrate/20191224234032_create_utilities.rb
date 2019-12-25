class CreateUtilities < ActiveRecord::Migration[6.0]
  def up
    create_table :utilities do |t|
      t.string :company, null: false
      t.integer :amount, null: false
      t.date :date_issued, null: false

      t.timestamps
    end
  end

  def down
      drop_table :utilities
  end
end
