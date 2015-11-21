class AddGithubLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_link, :string
  end
end
