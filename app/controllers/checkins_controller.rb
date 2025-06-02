class CheckinsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @habit = current_user.habits.find(params[:habit_id])
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    
    @checkin = @habit.habit_checkins.new(date: date)
    
    if @checkin.save
      respond_to do |format|
        format.html { redirect_to habits_path, notice: "Habit marked as done!" }
        format.turbo_stream
      end
    else
      redirect_to habits_path, alert: "Could not mark habit: #{@checkin.errors.full_messages.join(', ')}"
    end
  end
  
  def destroy
    @checkin = HabitCheckin.joins(:habit).where(habits: { user_id: current_user.id }).find(params[:id])
    @habit = @checkin.habit
    @date = @checkin.date
    @checkin.destroy
    
    respond_to do |format|
      format.html { redirect_to habits_path, notice: "Check-in removed" }
      format.turbo_stream
    end
  end
end