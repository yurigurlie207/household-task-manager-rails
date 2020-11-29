class Subtask < ApplicationRecord
  belongs_to :task
  has_many :user_tasks, dependent: :destroy
  has_many :users, :through => :user_tasks

  validates :title, presence: true
  validates :notes, length: { maximum: 500 }
  validates :estimated_duration, inclusion: { in: [5,10,15,20,25,30,45,60] }
  validates :actual_duration, inclusion: { in: [5,10,15,20,25,30,45,60] }
  validates :priority, inclusion: { in: [low, medium, high] }

end
