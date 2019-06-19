class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.valid?
      @habit.save
      redirect_to user_habit_path(@habit)
    else
      render :new
    end
  end

  def update

  end

  def delete

  end

  private
    def habit_params
      params.require(:habit).permit(:name, :category, :goal, :user_id)
    end

end
