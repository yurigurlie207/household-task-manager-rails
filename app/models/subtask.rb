class Subtask < ApplicationRecord
  belongs_to :task
  has_many :user_tasks, dependent: :destroy
  has_many :users, :through => :user_tasks

  validates :title, presence: true
  validates :notes, length: { maximum: 500 }
  validates :has_user_ids

  def has_users_ids
    errors.add(:base, 'must assign at least one user') if self.user_ids.blank?
  end

end
