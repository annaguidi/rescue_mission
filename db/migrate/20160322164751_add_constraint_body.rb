class AddConstraintBody < ActiveRecord::Migration
  def change
    change_column :questions, :body, :string, null: false
  end
end
