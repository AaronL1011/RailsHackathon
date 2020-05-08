class AddLanguageToRepos < ActiveRecord::Migration[5.2]
  def change
    add_column :repos, :language, :string
  end
end
