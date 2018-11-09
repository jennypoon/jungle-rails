class DropInstalls < ActiveRecord::Migration
  def change
    drop_table(:users, if_exists: true)
  end
end
