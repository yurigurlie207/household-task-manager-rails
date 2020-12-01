class Subtask < ApplicationRecord
  # include ActiveModel::Validations

  belongs_to :task
  has_many :user_tasks, dependent: :destroy
  has_many :users, :through => :user_tasks

  validates :title, presence: true
  validates :notes, length: { maximum: 500 }

  # validates_with SubtaskusersValidator

end
