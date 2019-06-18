class HabitsController < ApplicationController
  def show

  end

  def new
    @habit = Habit.new
  end

  def create

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
