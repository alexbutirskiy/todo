class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :task, index: true, foreign_key: true
      t.text :txt
      t.attachment :attachment

      t.timestamps null: false
    end
  end
end
