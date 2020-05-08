class AddColumnsToRepo < ActiveRecord::Migration[5.2]
  def change
    add_column :repos, :forks, :integer
    add_column :repos, :owner, :string
  end
end
