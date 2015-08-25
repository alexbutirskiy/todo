class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tasks, :status
  end
end
