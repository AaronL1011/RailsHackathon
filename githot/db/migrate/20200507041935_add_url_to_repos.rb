class AddUrlToRepos < ActiveRecord::Migration[5.2]
  def change
    add_column :repos, :url, :string
  end
end
