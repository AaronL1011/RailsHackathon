class CreateRepos < ActiveRecord::Migration[5.2]
  def change
    create_table :repos do |t|
      t.string :title
      t.text :description
      t.integer :stars

      t.timestamps
    end
  end
end
