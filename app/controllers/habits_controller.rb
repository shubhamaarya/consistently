class HabitsController < ApplicationController
  
  def index
    @habits = current_user.habits.includes(:habit_checkins)
    @today = Date.today
    @start_date = @today - 6.days 
  end
  
  def new
    @habit = current_user.habits.new
  end
  
  def create
    @habit = current_user.habits.new(habit_params)
    if @habit.save
      redirect_to habits_path, notice: "Habit created successfully"
    else
      render :new
    end
  end
  
  def edit
    @habit = current_user.habits.find(params[:id])
  end
  
  def update
    @habit = current_user.habits.find(params[:id])
    if @habit.update(habit_params)
      redirect_to habits_path, notice: "Habit updated successfully"
    else
      render :edit
    end
  end
  
  def destroy
    @habit = current_user.habits.find(params[:id])
    @habit.destroy
    redirect_to habits_path, notice: "Habit deleted successfully"
  end
  
  private
  
  def habit_params
    params.require(:habit).permit(:name, :description)
  end
end
