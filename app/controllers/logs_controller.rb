class LogsController < ApplicationController
  def index
    @workout = Workout.find(params[:workout_id])
    @split = @workout.split
    @split_exercises = @split.split_exercises
    @logs = @workout.logs
    @log = Log.new
  end

  def new
    @split = Split.find(params[:split_id])
    @programme = @split.programme
    @splits = @programme.splits
    @log = Log.new
  end

  def create
    @split_exercise = SplitExercise.find(params[:split_exercise_id])
    @workout = Workout.find(params[:workout_id])
    @log = Log.new(log_params)
    @log.split_exercise = @split_exercise
    @log.workout = @workout
    @log.weight = 0 if @log.weight.nil?
    if @log.save
      redirect_to workout_logs_path(@workout)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @workout = @log.workout
    @log.destroy
    redirect_to workout_logs_path(@workout)
  end

  private

  def log_params
    params.require(:log).permit(:weight, :repetitions)
  end
end
