class LogsController < ApplicationController
  def new
    @split = Split.find(params[:split_id])
    @programme = @split.programme
    @splits = @programme.splits
    @log = Log.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @split_exercise = SplitExercise.find(params[:split_exercise_id])
    @log = Log.new(log_params)
    @log.save
  end

  private

  def log_params
    params.require(:log).permit(:weight, :repetitions)
  end
end
