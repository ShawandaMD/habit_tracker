class HabitsController < ApplicationController
  before_action :logged_in?

  def index
    @habits = Habit.all
    respond_to do |f|
      f.html {render :index}
			f.json {render json: @habits}
    end
  end

  def show
    @habit = Habit.find(params[:id])
    respond_to do |f|
      f.html {render :show}
			f.json {render json: @habit}
    end
  end

  def new
    @habit = Habit.new(user_id: current_user.id)#knows to go to nested route

  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      respond_to do |f|
        f.html {redirect_to user_habits_path}
  			f.json {render json: @habit}
      end
    else
      render :new
    end
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    @habit = Habit.find(params[:id])
    @habit.update(habit_params)
    if @habit.save
      redirect_to user_habit_path(@habit.id)
    else
      render :edit
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.destroy
    flash[:notice] = "Habit Deleted!"
    redirect_to user_habits_path(current_user.id)
  end

  private
    def habit_params
      params.require(:habit).permit(:name, :category, :goal)
    end

end
