class DeleteColum < ActiveRecord::Migration
  def change
    remove_column :answers, :best_answer, :boolean
  end
end
