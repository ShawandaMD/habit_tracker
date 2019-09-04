class Habit < ActiveRecord::Base
  has_many :activities
  has_many :events, through: :activities
  belongs_to :user


  validates :name, presence: true
  validates :category, presence: true
  validates :goal, presence: true

  def completed_activity_name
    self.activities.where("action = ?","Completed").map do |act|
      act.action
    end  
  end
end
