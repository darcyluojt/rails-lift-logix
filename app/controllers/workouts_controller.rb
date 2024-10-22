class WorkoutsController < ApplicationController
  def index
    if current_user.programmes.empty?
      redirect_to new_programme_path
    else
      @programme = Programme.find(params[:programme_id])
      @splits = @programme.splits
      @workout = Workout.new
    end
  end

  def create
    @workout = Workout.new
    @workout.split = Split.find(params[:split_id])
    @workout.date = Date.today
    @workout.done = false
    if @workout.save
      redirect_to workout_logs_path(@workout)
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.done = true
    @workout.save
  end
end
