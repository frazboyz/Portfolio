class AddVisibilityToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :visible, :boolean
  end
end
