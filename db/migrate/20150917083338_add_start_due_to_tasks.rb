class AddStartDueToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :start_date, :datetime
    add_column :tasks, :due_date, :datetime
  end
end
