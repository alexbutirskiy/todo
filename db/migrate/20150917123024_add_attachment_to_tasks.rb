class AddAttachmentToTasks < ActiveRecord::Migration
  def change
    add_attachment :tasks, :attachment
  end
end
