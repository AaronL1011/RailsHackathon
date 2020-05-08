class AddLikesAndDislikesToRepo < ActiveRecord::Migration[5.2]
  def change
    add_column :repos, :likes, :integer
    add_column :repos, :dislikes, :integer
  end
end
