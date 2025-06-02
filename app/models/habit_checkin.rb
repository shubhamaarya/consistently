class HabitCheckin < ApplicationRecord
  belongs_to :habit
  validates :date, presence: true
  validates :habit_id, uniqueness: { scope: :date, message: "already checked in for this date" }
  
  scope :for_date_range, ->(start_date, end_date) { where(date: start_date..end_date) }
end
