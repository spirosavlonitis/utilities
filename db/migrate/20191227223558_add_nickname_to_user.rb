class AddNicknameToUser < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :nickname
    add_column :users, :nickname, :string, null: false
  end

  def down
    remove_column :users, :nickname
  end
end
