class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true
  validates :priority, presence: true

  has_attached_file :attachment
  validates_attachment :attachment, content_type: {
    :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
