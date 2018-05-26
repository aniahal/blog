class AddConstraintsToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :body, :string, null: false
    change_column :comments, :commenter, :string, null: false
  end
end
