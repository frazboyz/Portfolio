class RemoveKnowledgeFromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :knowledge, :integer
  end
end
