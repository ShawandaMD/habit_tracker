class ActivitiesController < ApplicationController
  def index

  end

  def new
    @activity = Activity.new(habit_id: current_habit.id)
  end

  def create
    @activity = Activity.new
  end

  def edit

  end

  def update

  end

  def delete

  end
end
