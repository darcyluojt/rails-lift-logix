class SplitsController < ApplicationController
  def index
    @splits = Split.all
  end

  def show
    @split = Split.find(params[:id])
    # get all exercises except for @split.split_exercises and for the correct category
    @exercises = Exercise.where("'#{@split.category}' = ANY(category_array)")
    @exercises =  @exercises - @split.exercises
    @split_exercise = SplitExercise.new
    if @split.programme.splits.last == @split
      @next_split = nil
    else
      @next_split = @split.programme.splits.where("id > ?", @split.id).first
    end
  end

  private
  def strong_params
    params.require(:split).permit(exercise_ids: [])
  end

end
