class Comment < ActiveRecord::Base
  belongs_to :task

  has_attached_file :attachment, override_file_permissions: false

  # validates_attachment :attachment, content_type: {
  #   content_type: %w(application/pdf)
  # }
  do_not_validate_attachment_file_type :attachment
end
