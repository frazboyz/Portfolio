class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.text :summary
      t.text :content
      t.string :color
      t.integer :knowledge
    end
  end
end
