class AddConstraintsToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :title, :string, null: false
  end
end
