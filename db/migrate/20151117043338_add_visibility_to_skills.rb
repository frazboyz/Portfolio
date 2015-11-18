class AddVisibilityToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :visible, :boolean
  end
end
