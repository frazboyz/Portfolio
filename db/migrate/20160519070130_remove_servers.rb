class RemoveServers < ActiveRecord::Migration
  def up
    drop_table :servers
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
