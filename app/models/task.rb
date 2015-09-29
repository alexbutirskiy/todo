class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true
  validates :priority, presence: true

  has_many :comments
end
