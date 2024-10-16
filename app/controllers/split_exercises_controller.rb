class SplitExercisesController < ApplicationController

  def create
    @split = Split.find(params[:split_id])
    @split_exercise = @split.split_exercises.build(split_exercise_params)
    @split_exercise.save
    redirect_to split_path(@split)
  end

  private
  def split_exercise_params
    params.require(:split_exercise).permit(:exercise_id)
  end

end
