class WorkoutsController < ApplicationController

  def index
    @split = Split.find(params[:split_id])
    @programme = @split.programme
    @splits = @programme.splits
    @workout = Workout.new
  end

  def create
    @workout = Workout.new
    @workout.split = Split.find(params[:split_id])
    @workout.date = Date.today
    @workout.done = false
    if @workout.save
      redirect_to new_split_log_path(@workout.split)
    else
      render 'index', status: :unprocessable_entity
    end
  end
end
