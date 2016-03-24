class AddColumn < ActiveRecord::Migration
  def change
    add_column :answers, :best_answer, :boolean, default: false, null: false
  end
end
