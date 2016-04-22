class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :content
    end
  end
end
