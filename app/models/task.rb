class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true
  validates :priority, presence: true
end
