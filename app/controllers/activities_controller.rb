class ActivitiesController < ApplicationController
  before_action :logged_in?
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new(habit_id: current_habit.id)
    @activity.build_event
  end

  def create
    @activity = current_habit.activities.build(activity_params)
    if @activity.save
      redirect_to habit_activities_path
    else
      render :new  #add error_explanation to form
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  private
    def activity_params
      params.require(:activity).permit(:action, :event_id, event_attributes: [:occurance])
    end
end
