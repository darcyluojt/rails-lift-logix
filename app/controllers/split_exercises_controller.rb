class SplitExercisesController < ApplicationController

  def create
    @split = Split.find(params[:split_id])
    @split_exercise = @split.split_exercises.build(split_exercise_params)
    if @split_exercise.save
      redirect_to split_path(@split)
    else
      render 'splits/show', status: :unprocessable_entity
    end
  end

  def destroy
    @split_exercise = SplitExercise.find(params[:id])
    @split = @split_exercise.split
    @split_exercise.destroy
    redirect_to split_path(@split)
  end

  private
  def split_exercise_params
    params.require(:split_exercise).permit(:exercise_id)
  end

end
