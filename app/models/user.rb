class User < ApplicationRecord
   has_secure_password
   has_many :user_tasks, dependent: :destroy
   has_many :subtasks, :through => :user_tasks
   has_many :tasks, :through => :subtasks

   validates :username, presence: true
   validates :password, presence: true
   validates :password, length: { in: 6..20 }
   validates :email, presence: true

   validates :username, uniqueness: {
      message: 'is already being used by another user'
    }
    validates :email, uniqueness: {
      message: 'another user already has this email'
    }
    # validates :birthdate, date: { before: Proc.new { Time.now } }
    

   #  validates :title, presence: true
   #  validates :title, uniqueness: {
   #    scope: %i[release_year artist_name],
   #    message: 'cannot be repeated by the same artist in the same year'
   #  }
   #  validates :released, inclusion: { in: [true, false] }
   #  validates :artist_name, presence: true
  
   #  with_options if: :released? do |song|
   #    song.validates :release_year, presence: true
   #    song.validates :release_year, numericality: {
   #      less_than_or_equal_to: Date.today.year
   #    }
   #  end
  
   #  def released?
   #    released
   #  end

   # validates :name, length: { minimum: 2 }
   # validates :bio, length: { maximum: 500 }
   # validates :password, length: { in: 6..20 }
   # validates :registration_number, length: { is: 6 }

   # validates :not_a_robot, acceptance: true, message: "Humans only!"
   # validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
