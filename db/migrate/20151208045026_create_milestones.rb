class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.string :summary
      t.string :content
      t.date :date
    end
  end
end
