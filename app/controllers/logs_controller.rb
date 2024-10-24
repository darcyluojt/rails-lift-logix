class LogsController < ApplicationController
  def index
    # retrive that specific workout by finding its workout_id
    @workout = Workout.find(params[:workout_id])
    # fetch exercises user put in the split
    @split = @workout.split
    @split_exercises = @split.split_exercises
    @exercises = @split_exercises.map(&:exercise)
    # get logs for the user filter by the exercises
    @user_logs = Log.joins(split_exercise: :exercise) # Join split_exercise to exercise
                    .joins(workout: { split: { programme: :user } }) # Join workout -> split -> programme -> user
                    .where(users: { id: current_user.id }, split_exercises: { exercise_id: @exercises.map(&:id) })

    @heavy_sets = {}
    @exercises.each do |exercise|
      @heavy_sets[exercise.name] =
        @user_logs.where(split_exercises: { exercise_id: exercise.id }).order(weight: :desc).first
    end
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
