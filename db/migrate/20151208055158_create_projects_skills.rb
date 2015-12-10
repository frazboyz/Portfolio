class CreateProjectsSkills < ActiveRecord::Migration
  def change
    create_table :projects_skills do |t|
      t.references :skill
      t.references :project
    end
  end
end
