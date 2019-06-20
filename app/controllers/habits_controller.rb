class HabitsController < ApplicationController
  before_action :logged_in?

  def index
    @habits = Habit.all
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new(user_id: current_user.id)#knows to go to nested route

  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      redirect_to user_habit_path(@habit.id)
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
      params.require(:habit).permit(:name, :category, :goal)
    end

end
