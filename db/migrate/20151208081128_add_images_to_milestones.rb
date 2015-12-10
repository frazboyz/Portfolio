class AddImagesToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :image, :string
  end
end
