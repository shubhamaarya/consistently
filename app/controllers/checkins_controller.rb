class CheckinsController < ApplicationController
  include Turbo::Streams::ActionHelper
  include ActionView::RecordIdentifier

  before_action :set_habit, only: [:create, :destroy]

  def create
    @checkin = @habit.habit_checkins.create!(date: params[:date])
    @date = @checkin.date
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to habits_path, notice: "Check-in created" }
    end
  
  end

  def destroy
    @checkin = @habit.habit_checkins.find(params[:id])
    @date = @checkin.date
    @checkin.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to habits_path}
    end
  end

  private

  def set_habit
    @habit = current_user.habits.find(params[:habit_id])
  end

end
