class Adduser < ActiveRecord::Migration[6.0]
  def up
    add_reference :utilities, :user, index: true
  end

  def down
      drop_reference :utilities, :user
  end
end
