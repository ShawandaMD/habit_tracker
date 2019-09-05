class ActivitiesController < ApplicationController
  before_action :logged_in?
  def index
    @activities = Activity.all
    #@activity = Activity.find(params[:id])
    respond_to do |f|
          f.html {render :index}
    			f.json {render json: @activities}
    end
  end

  def show
    @activity = Activity.find(params[:id])
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
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to habit_activities_path
    else
      render :edit
    end
  end

  def delete

  end

  private
    def activity_params
      params.require(:activity).permit(:action, :event_id, event_attributes: [:occurance])
    end
end
