class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_checkins, dependent: :destroy
  
  validates :name, presence: true



  def current_streak
    streak = 0
    date = Date.today
    while habit_checkins.exists?(date: date)
      streak += 1
      date -= 1.day
    end
    streak
  end

  def longest_streak
    dates = habit_checkins.order(date: :asc).pluck(:date)
    return 0 if dates.empty?
    
    longest = current = 1
    (1...dates.length).each do |i|
      if dates[i] == dates[i-1] + 1.day
        current += 1
        longest = [longest, current].max
      else
        current = 1
      end
    end
    longest
  end

  def consistency_percentage
    total_days = (Date.today - created_at.to_date).to_i + 1
    return 0 if total_days.zero?
    
    (habit_checkins.count.to_f / total_days * 100).round
  end
end
